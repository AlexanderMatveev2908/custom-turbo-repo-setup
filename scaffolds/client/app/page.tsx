/** @jsxImportSource @emotion/react */
"use client";

import { useWrapMutation } from "@/core/hooks/api/useWrapMutation";
import { useWrapQuery } from "@/core/hooks/api/useWrapQuery";
import { testSliceAPI } from "@/features/test/slices/api";
import { __cg } from "@shared/first/lib/logger.js";
import type { FC } from "react";

const Home: FC = () => {
  const res = testSliceAPI.useGetHelloQuery();

  useWrapQuery({
    ...res,
    showToast: true,
  });

  const [mutate] = testSliceAPI.usePosHelloMutation();
  const { wrapMutation } = useWrapMutation();

  const handleClick = async () => {
    const res = await wrapMutation({
      cbAPI: () => mutate({ msg: "Client message" }),
    });

    __cg("home res", res);
  };

  return (
    <div className="w-full h-full min-h-screen flex justify-center items-center gap-20">
      <span className="text-3xl font-bold text-neutral-200">
        Script worked ✌🏽
      </span>

      <button
        onClick={handleClick}
        className="py-2 px-6 rounded-xl w-[300px] border-2 border-white text-xl text-white"
      >
        Click me
      </button>
    </div>
  );
};

export default Home;
