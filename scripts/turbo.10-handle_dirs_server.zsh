handle_dirs_server(){

DIR_SERVER_SRC="apps/server/src"
DIR_SERVER="apps/server"
DIRS=(
  "$DIR_SERVER/assets"
  "$DIR_SERVER/assets/images"
  "$DIR_SERVER/assets/markdown"
  "$DIR_SERVER/assets/videos"
  "$DIR_SERVER/certs"
  "$DIR_SERVER/logger"
  "$DIR_SERVER/models"
  "$DIR_SERVER/prisma"
  "$DIR_SERVER/uploads"
)

for dir in "${DIRS[@]}"; do
  mkdir -p "$dir"
done

cp -r /home/ninja/scaffolds/server/. "$DIR_SERVER/src/"
}
