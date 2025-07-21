/** @jsxImportSource @emotion/react */
"use client";

import { AppEventT } from "@/common/types/api";
import type { FC } from "react";
import { IconType } from "react-icons";
import WrapBtn from "../HOC/WrapBtn";
import { css, SerializedStyles } from "@emotion/react";
import { $appClr } from "@/core/uiFactory/style";

type PropsType = {
  handleClick: () => void;
  label?: string;
  $customLabelCSS?: SerializedStyles;
  Svg?: IconType;
  act?: AppEventT;
  isEnabled?: boolean;
  isLoading?: boolean;
  type?: "button" | "submit";
};

const ShadowBtn: FC<PropsType> = ({
  Svg,
  label,
  $customLabelCSS,
  handleClick,
  isLoading,
  act = "NONE",
  isEnabled = true,
  type = "button",
}) => {
  const $clr = $appClr[act];

  return (
    <WrapBtn {...{ isLoading }}>
      <button
        type={type}
        onClick={handleClick}
        disabled={!isEnabled}
        className="btn__app w-full flex justify-center items-center gap-5 py-2 px-4 rounded-xl"
        style={
          {
            "--scale__up": 1.2,
          } as React.CSSProperties
        }
        css={css`
          border: 2px solid ${$clr};
          color: var(--neutral__300);

          &:enabled:hover {
            box-shadow: 0 0 5px ${$clr}, 0 0 10px ${$clr}, 0 0 15px ${$clr},
              0 0 20px ${$clr}, 0 0 25px ${$clr}, 0 0 30px ${$clr};
            color: ${$clr};
          }
        `}
      >
        {Svg && <Svg className="min-w-[35px] min-h-[35px]" />}

        {label && (
          <span
            css={css`
              ${$customLabelCSS}
            `}
            className="txt__md"
          >
            {label}
          </span>
        )}
      </button>
    </WrapBtn>
  );
};

export default ShadowBtn;
