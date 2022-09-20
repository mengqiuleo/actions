echo -e "---------docker Login--------"
docker login --username=$1 registry.cn-shanghai.aliyuncs.com --password=$2

echo -e "---------停止旧版容器--------"
docker stop ${{ secrets.DOCKER_REPOSITORY }} 

echo -e "--------- # 删除旧版容器--------"
docker rm ${{ secrets.DOCKER_REPOSITORY }}

echo -e "-----------# 删除旧版镜像----------------"
docker rmi registry.cn-shanghai.aliyuncs.com/pjy_github/${{ secrets.DOCKER_REPOSITORY }}:latest

echo -e "---------docker Pull--------"
docker pull registry.cn-shanghai.aliyuncs.com/pjy_github/${{ secrets.DOCKER_REPOSITORY }}:latest

echo -e "---------docker Create and Start--------"
docker run --rm -d -p 5555:80 --name ${{ secrets.DOCKER_REPOSITORY }} registry.cn-shanghai.aliyuncs.com/pjy_github/${{ secrets.DOCKER_REPOSITORY }}:latest

echo -e "---------deploy Success--------"