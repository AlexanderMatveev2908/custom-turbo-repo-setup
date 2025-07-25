add_env_file(){
cat <<EOF > .gitignore
# === Yarn Berry ===
.yarn/*
!.yarn/patches
!.yarn/plugins
!.yarn/releases
!.yarn/sdks
!.yarn/versions
!.yarnrc.yml

# node_modules (needed even if not using PnP)
node_modules

# TypeScript build cache
*.tsbuildinfo

# PnP files (only if not using zero-installs)
.pnp.*
.pnp

# === TurboRepo ===
# Ignore Turbo build artifacts
turbo
.turbo
dist



# === Logs ===
logs
*.log
npm-debug.log*
yarn-debug.log*
yarn-error.log*

# === OS junk ===
.DS_Store
Thumbs.db

# === Editor config ===
.vscode
.idea
*.sw?

# === Build folders ===
apps/*/dist
packages/*/dist
apps/*/.next
apps/*/out
packages/*/.turbo

# === Certs / Secrets / etc ===
*.pem
*.key
*.crt
.env
.env.*


logger/
uploads/
assets/

EOF

touch .dockerignore
cat > .dockerignore <<EOF
# === Yarn Berry ===
# Ignore everything in .yarn except what's needed
.yarn/*
!.yarn/patches/
!.yarn/plugins/
!.yarn/releases/
!.yarn/sdks/
!.yarn/versions/
!.yarnrc.yml

node_modules/

*.tsbuildinfo

turbo/
.turbo/

dist/

# === Logs ===
logs/
*.log
npm-debug.log*
yarn-debug.log*
yarn-error.log*

# === OS junk ===
.DS_Store
Thumbs.db

# === Editor junk ===
.vscode/
.idea/
*.sw?

# === Build folders ===
apps/*/.next/
apps/*/out/

# === Certs / Secrets / etc ===
*.pem
*.key
*.crt
.env
.env.*

logger/
uploads/
assets/
EOF
}
