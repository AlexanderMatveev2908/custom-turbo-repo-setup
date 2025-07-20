add_vercel_conf(){
  cat <<EOF > vercel.json
{
  "ignoreCommand": "node vercel-ignore-build-step.js",
  "build": {
    "env": {
      "ONLY_DEPLOY_MAIN": "true"
    }
  },
  "github": {
    "enabled": true,
    "silent": false,
    "deployments": {
      "enabled": true,
      "productionBranch": "main",
      "previewDeploymentSuffix": false
    }
  }
}
EOF

  cat <<'EOF' > vercel-ignore-build-step.js
import { exit } from "process";

const branch = process.env.VERCEL_GIT_COMMIT_REF || process.env.GIT_BRANCH;

console.log(`Detected branch: ${branch}`);

if (branch !== "main") {
  console.log(`⛔ Skipping build for branch: ${branch}`);
  exit(0);
}

console.log(`✅ Proceeding with build for branch: ${branch}`);
process.exit(1);
EOF
}
