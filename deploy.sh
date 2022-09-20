echo -e "---------docker Login--------"
docker login --username=$1 registry.cn-shanghai.aliyuncs.com --password=$2
echo -e "---------docker Stop--------"
docker stop admin
echo -e "---------docker Rm--------"
docker rm admin
docker rmi registry.cn-shanghai.aliyuncs.com/pjy_github/action:latest
echo -e "---------docker Pull--------"
docker pull registry.cn-shanghai.aliyuncs.com/pjy_github/action:latest
echo -e "---------docker Create and Start--------"
docker run --rm -d -p 5555:80 --name admin registry.cn-shanghai.aliyuncs.com/pjy_github/action:latest
echo -e "---------deploy Success--------"