FROM node:8.12-alpine

ENV NODE_ENV production

# Create app directory
WORKDIR /usr/src/app

RUN apk update && apk add yarn git python g++ make && rm -rf /var/cache/apk/*

COPY package.json ./
COPY yarn.lock ./

# RUN npm install
# If you are building your code for production
RUN yarn --production

# Bundle app source
COPY . .

RUN apk del git python g++ make

EXPOSE 8080
CMD [ "yarn", "devScanner" ]