/* eslint-disable @typescript-eslint/no-explicit-any */
/** @jsxImportSource @emotion/react */
"use client";

import type { FC } from "react";
import { css } from "@emotion/react";
import { resp } from "@/core/lib/style";
import BounceErr from "@/common/components/elements/CounceErr";
import ShadowBtn from "@/common/components/buttons/ShadowBtn";
import { __cg } from "@shared/first/lib/logger.js";

type PropsType = {
  error: any;
  reset: () => void;
};

const Err: FC<PropsType> = ({ error: err }: PropsType) => {
  __cg("err", err);

  return (
    <div className="w-full min-h-[75vh] flex flex-col items-center justify-center gap-10 sm:gap-16">
      <BounceErr
        {...{
          $customCSS: css`
            width: 175px;
            height: 175px;

            ${resp("sm")} {
              width: 300px;
              height: 300px;
            }
          `,
        }}
      />

      <div className="w-full flex justify-center max-w-[90%] sm:max-w-[75%]">
        <span className="text-gray-300  txt__lg">
          {err instanceof Error ? err?.message : err?.data?.msg ?? err?.msg}
        </span>
      </div>

      <div className="w-[250px]">
        <ShadowBtn
          {...{
            handleClick: () => location.reload(),
            label: "Refresh",
            act: "ERR",
          }}
        />
      </div>
    </div>
  );
};

export default Err;
