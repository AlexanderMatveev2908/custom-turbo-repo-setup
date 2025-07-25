add_turbo_json(){
  cat <<EOF > turbo.json
{
  "\$schema": "https://turborepo.org/schema.json",
  "globalEnv": ["ONLY_DEPLOY_MAIN"],
  "tasks": {
    "dev": {
      "cache": false,
      "persistent": true,
      "dependsOn": ["^dev"],
      "outputs": []
    },

    "start": {
      "cache": false,
      "persistent": true,
      "dependsOn": ["^start"],
      "outputs": []
    },
    "@shared/first#start": {
      "outputs": ["dist/**"]
    },
    "client#start": {
      "dependsOn": ["@shared/first#start"],
      "outputs": [".next/**"]
    },
    "server#start": {
      "dependsOn": ["@shared/first#start"],
      "outputs": ["dist/**"]
    },

    "check": {
      "cache": false,
      "outputs": []
    },
    "build": {
      "dependsOn": ["^build"]
    },
    "@shared/first#build": {
      "outputs": ["dist/**"]
    },
    "client#build": {
      "dependsOn": ["@shared/first#build"],
      "outputs": [".next/**"]
    },
    "server#build": {
      "dependsOn": ["@shared/first#build"],
      "outputs": ["dist/**"]
    }
  }
}
EOF
}
