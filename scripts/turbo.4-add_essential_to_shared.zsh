add_essential_to_shared(){
jq '. + { type: "module", exports: { "./*": "./dist/*" } }' \
  packages/shared/package.json > tmp && \
  mv tmp packages/shared/package.json

cp -r /home/ninja/scaffolds/shared/. packages/shared/src/

yarn workspace @shared/first add uuid zod
yarn workspace @shared/first add -D tsx typescript
}
