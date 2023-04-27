FROM node:lts-alpine

WORKDIR /usr/src/angular

COPY ./package.json ./

RUN npm install

COPY ./ ./

EXPOSE 4200

CMD [ "npm", "run", "start" ]
