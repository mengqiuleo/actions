# FROM nginx:latest
# MAINTAINER xiyangbai@outlook.com # 维护者信息

# # 将项目根目录下dist文件夹下的所有文件复制到镜像中 /usr/share/nginx/html/ 目录下
# COPY dist/ /usr/share/nginx/html/
# COPY default.conf /etc/nginx/conf.d/default.conf

# ---------------------------分割线----------------------------------

FROM nginx
COPY ./dist/ /usr/share/nginx/html/
# 第一步nginx配置文件名称
COPY ./default.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
