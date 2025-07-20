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
  "$DIR_SERVER_SRC/conf"
  "$DIR_SERVER_SRC/decorators"
  "$DIR_SERVER_SRC/dev_only"
  "$DIR_SERVER_SRC/features"
  "$DIR_SERVER_SRC/lib"
  "$DIR_SERVER_SRC/middleware"
  "$DIR_SERVER_SRC/paperwork"
  "$DIR_SERVER_SRC/routes"
  "$DIR_SERVER_SRC/services"
  "$DIR_SERVER_SRC/types"
)

for dir in "${DIRS[@]}"; do
  mkdir -p "$dir"
done

}
