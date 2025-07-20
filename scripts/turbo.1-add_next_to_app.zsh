add_next_to_app(){

 rm -rf apps/client/

export CI=1

 yarn dlx create-next-app@latest apps/client \
  --typescript \
  --eslint \
  --tailwind \
  --app \
  --no-turbo \
  --bundler webpack \
  --src-dir \
  --import-alias="@/*" \
  --no-interactive


  if [[ ! -f apps/client/package.json ]]; then
  echo '{}' > apps/client/package.json
  fi

  jq '.name = "client" | .version = "1.0.0"' apps/client/package.json > tmp.json && mv tmp.json apps/client/package.json

  yarn workspace client add @emotion/react @emotion/styled @hookform/resolvers @reduxjs/toolkit axios dompurify lucide-react framer-motion mime-types react-icons react-redux uuid zod react-hook-form
  yarn workspace client add -D tsx @types/node sass @types/mime-types
}
