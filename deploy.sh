echo -e "---------docker Login--------"
docker login --username=$1 registry.cn-shanghai.aliyuncs.com --password=$2

echo -e "---------停止旧版容器--------"
docker stop actions 

echo -e "--------- # 删除旧版容器--------"
docker rm actions

echo -e "-----------# 删除旧版镜像----------------"
docker rmi registry.cn-shanghai.aliyuncs.com/pjy_github/actions:latest

echo -e "---------docker Pull--------"
docker pull registry.cn-shanghai.aliyuncs.com/pjy_github/actions:latest

echo -e "---------docker Create and Start--------"
docker run --rm -d -p 5555:80 --name actions registry.cn-shanghai.aliyuncs.com/pjy_github/actions:latest

echo -e "---------deploy Success--------"