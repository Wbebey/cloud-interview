# Stage 1: Build the app
FROM node:14 AS dependencies

ENV CI=true

WORKDIR /app

COPY package*.json ./

RUN yarn install --frozen-lockfile --only=production

# Stage 2: Create the production image
FROM node:14 AS production

ENV NODE_ENV=production

ENV PORT=3000

WORKDIR /app

COPY --from=dependencies /app/node_modules ./node_modules

COPY src/index.js .

EXPOSE 3000

CMD ["node", "index.js"]
