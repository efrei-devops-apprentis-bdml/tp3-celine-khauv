FROM node:10-alpine

RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app
WORKDIR /home/node/app
COPY api.js ./
COPY package*.json ./
USER node
RUN npm install
COPY --chown=node:node . .
EXPOSE 8081
CMD [ "node", "api.js", "240aa650f4db4e154a07d0459c30a347"]
