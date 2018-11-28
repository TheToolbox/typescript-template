FROM node:10-alpine as builder
COPY . .
RUN npm install
RUN npm run-script build

FROM node:10-alpine
COPY --from=builder compiled/src .
CMD node index.js