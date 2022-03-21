# build stage
FROM node:lts-alpine as build-stage
WORKDIR /app
COPY . ./
RUN rm -rf node_modules
RUN npm config set registry https://registry.npm.taobao.org
RUN npm i -g pnpm
RUN pnpm i
RUN pnpm run build

# production stage
FROM nginx:stable-alpine as production-stage
RUN mkdir -p /usr/share/nginx/html/vue3-admin-plus
COPY --from=build-stage /app/dist /usr/share/nginx/html/vue3-admin-plus
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]