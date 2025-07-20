generate_docker() {
  touch Dockerfile.client
  touch Dockerfile.server
  touch docker-compose.client.yml
  touch docker-compose.server.yml

  cat > Dockerfile.client <<EOF
FROM node:20 AS builder

WORKDIR /app

RUN corepack enable && corepack prepare yarn@4.9.2 --activate

COPY package.json yarn.lock .yarnrc.yml turbo.json ./
COPY packages/ ./packages/
COPY apps/client ./apps/client

ARG NEXT_PUBLIC_ENV
ENV NEXT_PUBLIC_ENV=\$NEXT_PUBLIC_ENV
ARG NEXT_PUBLIC_BACK_URL_DEV
ENV NEXT_PUBLIC_BACK_URL_DEV=\$NEXT_PUBLIC_BACK_URL_DEV
ARG NEXT_PUBLIC_BACK_URL
ENV NEXT_PUBLIC_BACK_URL=\$NEXT_PUBLIC_BACK_URL

RUN yarn install --immutable

RUN yarn turbo build --filter=client...

ENV NODE_PATH=/app/node_modules

EXPOSE 3001

CMD ["yarn", "workspace", "client", "start"]
EOF

  cat > Dockerfile.server <<EOF
FROM node:20 AS builder

WORKDIR /app

RUN corepack enable && corepack prepare yarn@4.9.2 --activate

COPY package.json yarn.lock .yarnrc.yml turbo.json ./
COPY packages/ ./packages/
COPY apps/server ./apps/server

RUN yarn install --immutable

RUN yarn dlx prisma generate --schema=./apps/server/prisma/schema.prisma && \
    yarn turbo build --filter=server...

ENV NODE_PATH=/app/node_modules

EXPOSE 3000

CMD ["yarn", "workspace", "server", "start"]
EOF

  cat > docker-compose.client.yml <<'EOF'
services:
  client:
    build:
      context: .
      dockerfile: Dockerfile.client
      args:
        NEXT_PUBLIC_ENV: ${NEXT_PUBLIC_ENV}
        NEXT_PUBLIC_BACK_URL_DEV: ${NEXT_PUBLIC_BACK_URL_DEV}
        NEXT_PUBLIC_BACK_URL: ${NEXT_PUBLIC_BACK_URL}
    env_file:
      - ./env
    ports:
      - "3001:3001"
EOF

  cat > docker-compose.server.yml <<'EOF'
services:
  server:
    build:
      context: .
      dockerfile: Dockerfile.server
    env_file:
      - ./env
    ports:
      - "3000:3000"
EOF
}
