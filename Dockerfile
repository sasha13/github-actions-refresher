# 1. Use a specific LTS version of Node.js on a lightweight Alpine Linux image
FROM node:20-alpine

# 2. Set the working directory inside the container
WORKDIR app

# 3. Copy application manifests first to leverage Docker layer caching
COPY package*.json ./

# 4. Install only production dependencies (speeds up build and minimizes size)
RUN npm i && npm run build

# 5. Copy the remaining source code files to the container
COPY . .

# 6. Inform Docker that the container listens on port 3000 at runtime
EXPOSE 3000

# 7. Use the built-in non-root 'node' user for security purposes
USER node

# 8. Define the command to execute your application
CMD ["node", "index.js"]
