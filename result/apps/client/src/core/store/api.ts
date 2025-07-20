import { createApi } from "@reduxjs/toolkit/query/react";
import { baseQueryAxs } from "./conf/baseQuery";
import { TagsAPI } from "@/common/types/api";

export const apiSlice = createApi({
  baseQuery: baseQueryAxs,
  tagTypes: Object.values(TagsAPI),
  reducerPath: "apiApp",
  endpoints: () => ({}),
});
