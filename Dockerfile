FROM node:alpine

EXPOSE 3000

RUN apk add --update tini
RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

COPY package.json package.json

RUN npm install && npm cache clean --force

COPY . .

CMD ["tini", "--", "node", "./bin/www"]
# docker build -t testnode .
# docker run --rm --name=testnode -p 80:3000 testnode