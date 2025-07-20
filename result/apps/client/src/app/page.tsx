/** @jsxImportSource @emotion/react */
"use client";

import { testSliceAPI } from "@/features/test/slices/api";
import { __cg } from "@shared/first/lib/logger.js";
import type { FC } from "react";

const Home: FC = () => {
  const result = testSliceAPI.useGetHelloQuery();

  __cg("res", result);

  return (
    <div className="w-full h-full min-h-screen flex justify-center items-center">
      <span className="text-3xl font-bold text-neutral-200">
        Script worked ✌🏽
      </span>
    </div>
  );
};

export default Home;
