FROM node:16-alpine

WORKDIR /home/backend
COPY package*.json yarn.* ./
RUN chown -R root:root /home/backend/
RUN yarn install
COPY . .

EXPOSE 3333
CMD [ "yarn", "dev" ]