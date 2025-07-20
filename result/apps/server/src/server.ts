import { __cg } from "@shared/first/lib/logger.js";
import fastify from "fastify";
import env from "./conf/env.js";
import { router } from "./routes/index.js";
import { catchErr } from "./middleware/catchErr.js";

const app = fastify({
  logger: {
    level: "warn",
  },
});

process.on("SIGTERM", () => {
  app.close(() => {
    __cg("Server closed on SIGTERM");
    process.exit(0);
  });
});

process.on("SIGINT", () => {
  app.close(() => {
    __cg("Server closed on SIGINT");
    process.exit(0);
  });
});

const start = async () => {
  try {
    await app.register(catchErr);
    await app.register(env);
    await app.register(router, {
      prefix: "/api/v1",
    });

    await app.listen({ port: app.env.PORT, host: app.env.HOST });

    __cg(`=> server running on ${app.env.PORT}`);
  } catch (err: any) {
    __cg("catch main err ☢️", err?.msg ?? err.message);

    process.exit(1);
  }
};

start();
