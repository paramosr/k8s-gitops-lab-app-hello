# syntax=docker/dockerfile:1.6
FROM node:20-alpine AS deps
WORKDIR /app
COPY package*.json ./
RUN npm ci --omit=dev

FROM gcr.io/distroless/nodejs20:nonroot
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY src ./src
USER nonroot:nonroot
EXPOSE 3000
CMD ["src/server.js"]
