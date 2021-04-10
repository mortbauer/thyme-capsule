FROM node:lts-alpine as base

WORKDIR /app
RUN apk add --no-cache --virtual .build-deps build-base alpine-sdk python
COPY package.json package.json
RUN npm install --production --silent
RUN apk del .build-deps
RUN mkdir src
COPY src/ src/
COPY .babelrc .sequelizerc ./
CMD ["npm","run", "production"]
