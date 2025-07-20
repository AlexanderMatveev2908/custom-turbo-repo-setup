import { BaseQueryT } from "@/core/store/conf/baseQuery";
import {
  TypedLazyQueryTrigger,
  TypedUseLazyQueryStateResult,
} from "@reduxjs/toolkit/query/react";

/* eslint-disable @typescript-eslint/no-explicit-any */

export enum TagsAPI {
  TEST = "TEST",
}

export enum AppEventT {
  OK = "OK",
  INFO = "INFO",
  WARN = "WARN",
  ERR = "ERR",
  NONE = "NONE",
}

export type ResApiT<T> = {
  data: {
    msg?: string;
    status?: number;
  } & T;
};

export type UnwrappedResApiT<T extends void | Record<string, any>> =
  T extends void
    ? { msg?: string; status?: number }
    : { msg?: string; status?: number } & T;

export type ErrApiT<T> = {
  data: { msg?: string; status?: number };
} & T;

export type TriggerTypeRTK<T, K> = TypedLazyQueryTrigger<T, K, BaseQueryT>;
export type ResultTypeRTK<T, K> = TypedUseLazyQueryStateResult<
  T,
  K,
  BaseQueryT
>;
