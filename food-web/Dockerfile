FROM legperez/yarn as builder
WORKDIR '/app'
COPY ./package.json ./tsconfig.json ./yarn.lock ./
RUN yarn install
COPY . .
CMD ["yarn", "start"]
RUN yarn build

FROM nginx
EXPOSE 3000
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /app/build /usr/share/nginx/html