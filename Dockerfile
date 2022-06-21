FROM node:16-alpine

WORKDIR /src/app

COPY ./package.json ./
COPY ./yarn.lock ./

RUN yarn install --frozen-lockfile

COPY . .

ENV NODE_ENV production

RUN yarn build

ENV HOST=0.0.0.0
ENV PORT=3000

EXPOSE 3000

CMD ["yarn", "start"]