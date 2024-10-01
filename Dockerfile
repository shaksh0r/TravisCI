FROM node:alpine AS buildprocess

WORKDIR /app

COPY package.json ./

RUN npm install

COPY . .

RUN npm run build

FROM nginx:alpine

COPY --from=buildprocess /app/dist /usr/share/nginx/html