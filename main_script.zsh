# yt stands for yarn turbo
yt() {
  prepare_env && \
  echo "✅ setup environment" && \
  add_next_to_app && \
  echo "✅ added Next.js app" && \
  add_fastify_to_app && \
  echo "✅ added Fastify app" && \
  handle_json && \
  echo "✅ modified json files" && \
  add_essential_to_shared && \
  echo "✅ installed generics in shared" && \
  add_vercel_conf && \
  echo "✅ generated vercel conf" && \
  generate_ts_confs && \
  echo "✅ generated ts config" && \
  add_turbo_json && \
  echo "✅ generated turbo file" && \
  add_env_file && \
  echo "✅ added gitignore" && \
  handle_dirs_client && \
  echo "✅ generated client dirs" && \
  handle_dirs_server && \
  echo "✅ generated server dirs" && \
  generate_docker && \
  echo "✅ generated docker files"

  echo "did stuff ✅✅✅"
}

# 