import Link from "next/link";
import type { FC } from "react";
import { GiPositionMarker } from "react-icons/gi";

const NotFound: FC = () => {
  return (
    <div className="mx-auto w-full max-w-[75%] min-h-[45vh] flex flex-col items-center justify-end gap-16">
      <div className="w-full flex justify-center">
        <span className="text-center text-8xl sm:text-9xl font-bold grad__txt">
          404
        </span>
      </div>

      <div className="w-full flex flex-col items-center gap-8 sm:gap-10">
        <span className="txt__xl  text-gray-300 text-center">
          This is not the page you are looking for
        </span>

        <div className="w-full flex justify-center">
          <Link
            href="/"
            className="link flex items-center gap-5 text-neutral-200"
          >
            <GiPositionMarker className="svg__md" />

            <span className="txt__2xl">Home</span>
          </Link>
        </div>
      </div>
    </div>
  );
};

export default NotFound;
