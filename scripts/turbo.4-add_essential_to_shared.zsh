add_essential_to_shared(){
jq '. + {exports: {"./*": "./dist/*"}}' \
  packages/shared/package.json > tmp && \
  mv tmp packages/shared/package.json


yarn workspace @shared/first add uuid zod
yarn workspace @shared/first add -D tsx typescript
}
