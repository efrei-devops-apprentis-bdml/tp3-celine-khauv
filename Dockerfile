FROM node:10-alpine

RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app
WORKDIR /home/node/app
COPY api.js ./
COPY package*.json ./
USER node
RUN npm install
COPY --chown=node:node . .
EXPOSE 8081
ENV API_KEY=secretcode
CMD [ "node", "api.js", "240aa650f4db4e154a07d0459c30a347"]

#RUN apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/v3.8/main/ nodejs=8.14.0-r0 npm 

#COPY api.js .
#COPY package*.json .

#RUN npm install

#EXPOSE 8081

#ENTRYPOINT node api.js