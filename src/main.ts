import { Application, Router } from "https://deno.land/x/oak/mod.ts";
import { config } from "./config.ts";

const app = new Application();
const router = new Router();

router.get("/", (ctx) => {
  ctx.response.body = "Hello World from Jooto Task Extractor API!";
});

router.get("/api/tasks", (ctx) => {
  ctx.response.body = {
    message: "This endpoint will extract tasks from Jooto in the future.",
  };
});

app.use(router.routes());
app.use(router.allowedMethods());

console.log(`Server running on http://localhost:${config.PORT}`);

await app.listen({ port: config.PORT });