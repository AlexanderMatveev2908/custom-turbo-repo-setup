import { FastifyInstance } from "fastify";
import { testHello } from "../controllers/get.js";
import { wrapAPI } from "@src/middleware/wrap.js";

export const testRouter = async (app: FastifyInstance) => {
  app.route({
    method: "GET",
    url: "/",
    handler: wrapAPI(testHello),
  });
};
