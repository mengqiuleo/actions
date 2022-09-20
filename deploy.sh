echo -e "---------docker Login--------"
docker login --username=$1 registry.cn-shanghai.aliyuncs.com --password=$2

echo -e "---------停止旧版容器--------"
docker stop $(docker ps --filter ancestor=${{ secrets.DOCKER_REPOSITORY }} -q)

echo -e "--------- # 删除旧版容器--------"
docker rm -f $(docker ps -a --filter ancestor=${{ secrets.DOCKER_REPOSITORY }}:latest -q)

echo -e "-----------# 删除旧版镜像----------------"
docker rmi -f $(docker images ${{ secrets.DOCKER_REPOSITORY }}:latest -q)

echo -e "---------docker Pull--------"
docker pull ${{ secrets.DOCKER_REPOSITORY }}:latest

echo -e "---------docker Create and Start--------"
docker run -d -p 5555:80 ${{ secrets.DOCKER_REPOSITORY }}:latest

echo -e "---------deploy Success--------"