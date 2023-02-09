#Stage 1
FROM node:19-alpine3.16 as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

#Stage 2
FROM nginx:1.23

COPY --from=builder /app/build /usr/share/nginx/html
