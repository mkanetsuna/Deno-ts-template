# Use the official Deno image
FROM denoland/deno:alpine-1.30.3

# Set the working directory
WORKDIR /app

# Copy the project files into the container
COPY . .

# Cache the dependencies
RUN deno cache src/main.ts

# Run the application
CMD ["run", "--allow-net", "src/main.ts"]
