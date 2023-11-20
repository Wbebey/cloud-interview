# Stage 1: install dependencies
FROM node:20.9.0-alpine@sha256:d18f4d9889b217d3fab280cc52fbe1d4caa0e1d2134c6bab901a8b7393dd5f53 AS dependencies

ENV CI=true

WORKDIR /app

COPY package*.json ./

RUN yarn install --frozen-lockfile --only=production

# Stage 2: Create the production image
FROM node:20.9.0-alpine@sha256:d18f4d9889b217d3fab280cc52fbe1d4caa0e1d2134c6bab901a8b7393dd5f53 AS production

ENV NODE_ENV=production

ENV PORT=80

WORKDIR /app

RUN addgroup -g 1001 ornikar && \
  adduser -D -u 1001 -G ornikar ornikar

USER ornikar

COPY --from=dependencies /app/node_modules ./node_modules

COPY src/index.js .

EXPOSE 80

CMD ["node", "index.js"]
