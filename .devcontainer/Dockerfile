# Base image with Deno installed
FROM denoland/deno:alpine-1.30.3

# Install additional dependencies if needed
# RUN apk add --no-cache git

# Set the working directory
WORKDIR /workspace

# Ensure deno task dev is available in the container
COPY . .

# Optional: Cache the dependencies
RUN deno cache src/main.ts

# Set the default command
CMD ["deno", "task", "dev"]
