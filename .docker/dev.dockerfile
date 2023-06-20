FROM node:18-alpine

WORKDIR  /home/node/app
USER node

COPY --chown=node:node package.json yarn.lock ./

RUN yarn install --frozen-lockfile

COPY --chown=node:node . .

CMD yarn start
