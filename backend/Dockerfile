FROM node:18-alpine

WORKDIR /usr/src/app

# install dependencies
COPY package*.json ./
# Use npm install and omit dev dependencies when there's no package-lock.json
# `npm ci` requires a lockfile; `npm install --omit=dev` works reliably in this image.
RUN npm install --omit=dev --no-audit --no-fund

# copy source
COPY . .

EXPOSE 8080

ENV NODE_ENV=production

CMD ["node", "server.js"]
