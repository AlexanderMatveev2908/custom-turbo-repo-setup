add_fastify_to_app(){
yarn workspace server add \
  "@fastify/multipart" \
  "@fastify/rate-limit" \
  "@fastify/cookie" \
  "mime-types" \
  "sql-template-tag" \
  "zod" \
  "@fastify/cors@latest" \
  "@fastify/env@latest" \
  "dotenv@latest" \
  "fastify@latest"

yarn workspace server add -D \
  "@types/node" \
  "nodemon" \
  "pino-pretty" \
  "tsx" \
  "@types/mime-types" \
  "typescript" \
  "tsc-alias"
}
