handle_dirs_client(){

rm -rf apps/client/public/ apps/client/src/app/favicon.ico \
apps/client/src/app/globals.css

DIR_CLIENT="apps/client/src"

DIRS=(
  "$DIR_CLIENT/app"
  "$DIR_CLIENT/core/assets/imgs"
  "$DIR_CLIENT/core/assets/SVGs"
  "$DIR_CLIENT/core/constants"
  "$DIR_CLIENT/core/contexts"
  "$DIR_CLIENT/core/forms"
  "$DIR_CLIENT/core/hooks"
  "$DIR_CLIENT/core/paperwork"
  "$DIR_CLIENT/core/store"
  "$DIR_CLIENT/core/uiFactory"
  "$DIR_CLIENT/features"
  "$DIR_CLIENT/features/layout"
  "$DIR_CLIENT/features/_"
  "$DIR_CLIENT/common"
  "$DIR_CLIENT/common/components"
  "$DIR_CLIENT/common/components/buttons"
  "$DIR_CLIENT/common/components/spinners"
  "$DIR_CLIENT/common/components/SVGs"
  "$DIR_CLIENT/common/components/HOC"
  "$DIR_CLIENT/common/components/forms"
  "$DIR_CLIENT/common/components/dropMenu"
  "$DIR_CLIENT/common/components/shapes"
  "$DIR_CLIENT/common/components/elements"
  "$DIR_CLIENT/common/types"
  "$DIR_CLIENT/common"
  "$DIR_CLIENT/styles"
  "$DIR_CLIENT/styles/tokens"
)

for dir in "${DIRS[@]}"; do
  mkdir -p "$dir"
done

touch $DIR_CLIENT/middleware.ts

cat > "$DIR_CLIENT/middleware.ts" <<EOF 
import { NextRequest, NextResponse } from "next/server";

const shutBrowser = async (req: NextRequest) => {
  if (req.nextUrl.pathname.endsWith(".js.map"))
    return new Response(null, { status: 204 });

  return NextResponse.next();
};

export default shutBrowser;
EOF

touch $DIR_CLIENT/styles/t.css
touch $DIR_CLIENT/styles/globals.scss

cat > "$DIR_CLIENT/styles/t.css" <<EOF
@import "tailwindcss";
EOF
cat > "$DIR_CLIENT/styles/globals.scss" <<EOF
@use "./t.css";
EOF

cat > apps/client/next.config.ts <<EOF
import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  /* config options here */
  images: {
    remotePatterns: [
      {
        protocol: "https",
        hostname: "res.cloudinary.com",
        pathname: "/**",
      },
    ],
  },
};

export default nextConfig;
EOF

touch apps/client/svgr.config.js 
cat > apps/client/svgr.config.js <<EOF
/** @type {import('@svgr/core').Config} */
module.exports = {
  typescript: true,
  icon: true,
  svgProps: {
    "aria-hidden": "true",
    fill: "currentColor",
    stroke: "currentColor",
  },
  expandProps: "end",
  replaceAttrValues: {
    "#000": "currentColor",
    "#000000": "currentColor",
    black: "currentColor",
    "#fff": "currentColor",
    "#ffffff": "currentColor",
    white: "currentColor",
    inherit: "currentColor",

    "stroke:#000": "stroke:currentColor",
    "stroke:#000000": "stroke:currentColor",
    "stroke:black": "stroke:currentColor",
    "stroke:#fff": "stroke:currentColor",
    "stroke:#ffffff": "stroke:currentColor",
    "stroke:white": "stroke:currentColor",
  },
  dimensions: false,
  exportType: "default",
};
EOF

}

