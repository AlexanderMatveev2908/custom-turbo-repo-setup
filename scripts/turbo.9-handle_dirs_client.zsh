handle_dirs_client(){

rm -rf apps/client/public/{*,.*}(N) apps/client/src/app/favicon.ico \
apps/client/src/app/globals.css

DIR_CLIENT="apps/client/src"

yes | cp -rf /home/ninja/scaffolds/client/. "$DIR_CLIENT/"

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

