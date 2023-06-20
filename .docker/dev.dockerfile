FROM node:18-alpine

RUN apk update && apk add --no-cache python3 make g++

WORKDIR /home/node/app
COPY --chown=node:node package.json yarn.lock ./

RUN chown -R node:node /home/node/app && \
    chmod -R 755 /home/node/app

USER node

RUN yarn install --frozen-lockfile

COPY --chown=node:node . .

CMD yarn start
