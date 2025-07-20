generate_ts_confs(){

  cat > packages/shared/tsconfig.json <<EOF 
{
  "compilerOptions": {
    "target": "ES2020",
    "module": "NodeNext",
    "moduleResolution": "NodeNext",
    "strict": true,
    "esModuleInterop": true,
    "forceConsistentCasingInFileNames": true,
    "skipLibCheck": true,
    "resolveJsonModule": true,
    "outDir": "dist",
    "rootDir": "src",
    "baseUrl": ".",
    "composite": true,
    "paths": {
      "@shared/first/*": ["./src/*"]
    }
  },
  "include": ["src"]
}
EOF

cat > apps/server/tsconfig.json <<EOF
{
  "compilerOptions": {
    "target": "ES2020",
    "module": "NodeNext",
    "moduleResolution": "NodeNext",
    "strict": true,
    "esModuleInterop": true,
    "forceConsistentCasingInFileNames": true,
    "skipLibCheck": true,
    "resolveJsonModule": true,
    "outDir": "dist",
    "rootDir": "src",
    "baseUrl": ".",
    "paths": {
      "@src/*": ["./src/*"],
      "@shared/first/*": ["../../packages/shared/dist/*"]
    }
  },

  "include": ["src","../../packages/shared/dist/**/*"],
  "references": [{ "path": "../../packages/shared" }]
}
EOF



cat > apps/client/tsconfig.json <<EOF
{
  "compilerOptions": {
    "target": "ES2017",
    "lib": ["dom", "dom.iterable", "esnext"],
    "allowJs": true,
    "skipLibCheck": true,
    "strict": true,
    "noEmit": true,
    "esModuleInterop": true,
    "module": "esnext",
    "moduleResolution": "bundler",
    "resolveJsonModule": true,
    "isolatedModules": true,
    "jsx": "preserve",
    "incremental": true,
    "plugins": [
      {
        "name": "next"
      }
    ],
    "paths": {
      "@/*": ["./src/*"],
      "@shared/first/*": ["../../packages/shared/dist/*"]
    }
  },
  "include": [
    "next-env.d.ts",
    "**/*.ts",
    "**/*.tsx",
    ".next/types/**/*.ts",
    "../../packages/shared/dist/**/*"
  ],
  "exclude": ["node_modules"],
  "references": [{ "path": "../../packages/shared" }]
}
EOF
}
