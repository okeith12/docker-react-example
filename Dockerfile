FROM node:16-alpine AS base

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build



FROM nginx AS second_base

COPY --from=base /app/build /usr/share/nginx/html

