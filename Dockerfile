# FROM nginx:latest
# MAINTAINER xiyangbai@outlook.com # 维护者信息

# # 将项目根目录下dist文件夹下的所有文件复制到镜像中 /usr/share/nginx/html/ 目录下
# COPY dist/ /usr/share/nginx/html/
# COPY default.conf /etc/nginx/conf.d/default.conf

# ---------------------------分割线----------------------------------

FROM node:14
COPY ./ /app
WORKDIR /app
RUN yarn install && yarn build

FROM nginx
RUN mkdir /app
COPY --from=0 /app/dist /app
COPY default.conf /etc/nginx/nginx.conf
