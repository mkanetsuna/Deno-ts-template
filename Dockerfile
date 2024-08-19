FROM denoland/deno:1.32.3

WORKDIR /app

COPY . .

RUN deno cache src/main.ts

CMD ["run", "--allow-net", "--allow-env", "src/main.ts"]