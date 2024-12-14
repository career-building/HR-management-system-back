# Use Node.js official lightweight image
FROM node:18-alpine

# Install bash
RUN apk add --no-cache bash

# Set working directory inside the container
WORKDIR /app

# Install pnpm globally
RUN npm install -g pnpm



# Copy package.json and pnpm-lock.yaml for dependency installation
COPY package.json pnpm-lock.yaml ./

# Install dependencies
RUN pnpm install

# Copy the rest of the application code
COPY . .

# Expose the application port
EXPOSE 5000

# Start the application in development mode
CMD ["pnpm", "dev"]
