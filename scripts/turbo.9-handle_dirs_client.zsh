handle_dirs_client() {

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
  expandProps: "end",
  exportType: "default",
  dimensions: false,
  svgProps: {
    "aria-hidden": "true",
    fill: "currentColor",
    stroke: "currentColor",
  },
  svgo: true,
  svgoConfig: {
    plugins: [
      { name: "removeAttrs", params: { attrs: ["fill", "stroke"] } },
      { name: "inlineStyles", params: { onlyMatchedOnce: false } },
      { name: "removeStyleElement", active: true },
      { name: "removeEmptyContainers", active: true },
      { name: "removeUselessDefs", active: true },
      { name: "convertColors", active: true },
      { name: "cleanupAttrs", active: true },
    ],
  },
};
EOF

  touch apps/client/tailwind.config.ts
  cat > apps/client/tailwind.config.ts <<EOF
import type { Config } from "tailwindcss";

const config: Config = {
  content: ["./src/**/*.{js,ts,jsx,tsx}"],
  theme: {
    extend: {
      colors: {
      },
    },
  },
  plugins: [],
};

export default config;
EOF
}
