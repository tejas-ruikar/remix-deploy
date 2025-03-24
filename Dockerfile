# Use Node.js with glibc (Debian Bullseye version)
FROM node:18-bullseye AS builder

# Set working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json first
COPY package*.json ./

# Install dependencies (try npm install with --force and optional rebuild)
# RUN npm install --force --omit=optional
RUN npm install --omit=optional 
# RUN npm rebuild

# Install rollup-native module explicitly
RUN npm install @rollup/rollup-linux-x64-gnu --save-dev

# Copy the entire application
COPY . .

# Build the Remix application
RUN npx remix vite:build

# Use lightweight Node.js image for production
FROM node:18-bullseye AS runner
WORKDIR /usr/src/app

# Copy built files from builder stage
COPY --from=builder /usr/src/app/build ./build
COPY --from=builder /usr/src/app/node_modules ./node_modules
COPY --from=builder /usr/src/app/package.json ./package.json

# Set environment variables
ENV NODE_ENV=production
ENV PORT=3000

# Expose the port for the application
EXPOSE 3000

# Run the application
CMD ["node", "build/server/index.js"]
