echo -e "---------docker Pull--------"
docker pull mengqiuleo/actions-images:latest

echo -e "---------docker Stop--------"
docker stop actions

echo -e "---------docker Rm--------"
docker rm actions
docker rmi mengqiuleo/actions-images:latest

echo -e "---------docker Create and Start--------"
docker run --name actions -d -p 5555:80 mengqiuleo/actions-images:latest


# docker image prune -f
# docker container prune -f



