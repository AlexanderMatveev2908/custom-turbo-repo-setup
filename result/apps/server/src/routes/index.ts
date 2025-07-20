import { testRouter } from "@src/features/test/routes/index.js";
import { FastifyInstance } from "fastify";

export const router = async (app: FastifyInstance) => {
  await app.register(testRouter, { prefix: "test" });
};
