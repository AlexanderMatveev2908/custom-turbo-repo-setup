import type { Metadata } from "next";
import "../styles/globals.css";
import { Fira_Code } from "next/font/google";
import { genStoreSSR } from "@/core/store";
import Providers from "@/features/layout/shells/Providers";

const fira_code = Fira_Code({
  subsets: ["latin"],
  weight: ["300", "400", "500", "600", "700"],
  display: "swap",
});

export const metadata: Metadata = {
  title: "Next PERN courses",
  description: "Next PERN App for courses development",
  icons: {
    icon: "/favicon.svg",
  },
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  const store = genStoreSSR({});

  return (
    <html lang="en">
      <body
        className={`${fira_code.className} min-h-screen h-full antialiased bg-neutral-950`}
      >
        <Providers
          {...{
            preloadedState: store.getState(),
          }}
        >
          {children}
        </Providers>
      </body>
    </html>
  );
}
