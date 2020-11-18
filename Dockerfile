FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run builder

FROM nginx
COPY --from=buolder /app/build /usr/share/nginx