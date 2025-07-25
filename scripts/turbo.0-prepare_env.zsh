prepare_env(){
  export YARN_ENABLE_IMMUTABLE_INSTALLS=0

  sudo corepack enable && \
  corepack prepare yarn@4.9.1 --activate && \
  yarn set version berry && \
  echo "nodeLinker: node-modules" > .yarnrc.yml

  yarn init -y
  yarn add -D turbo concurrently prisma@latest tsx 
  
  mkdir -p apps/client apps/server packages/shared packages/_ 

  for dir in apps/client apps/server packages/shared; do
    (
      cd "$dir" || {
        echo "❌ Failed to cd into $dir. Skipping."
        exit 1
      }

      if [[ "$dir" == "packages/shared" ]]; then
        name="@shared/first"
      else
        name=$(basename "$PWD")
      fi

      if [[ ! -f package.json ]]; then
        echo '{}' > package.json
      fi

      tmp="package.json.tmp"
      jq --arg name "$name" '.name = $name | .version = "1.0.0"' package.json > "$tmp" \
        && mv "$tmp" package.json
    )
  done

  jq '.private = true | .workspaces = ["apps/*", "packages/*"]' \
    package.json > tmp && mv tmp package.json
 }
