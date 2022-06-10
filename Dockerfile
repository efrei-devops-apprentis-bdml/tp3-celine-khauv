FROM alpine:3.4

RUN apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/v3.8/main/ nodejs=8.14.0-r0 npm 

COPY api.js .
COPY package*.json .

RUN npm install

EXPOSE 8081

ENTRYPOINT node api.js