FROM node:10.12-alpine

RUN apk update && apk add git

WORKDIR /application

COPY package.json /application
RUN npm rebuild --force && npm install

COPY . /application

ENV NODE_ENV=production

RUN npm run build

ENV HOST 0.0.0.0
EXPOSE 3000

CMD ["npm", "start"]