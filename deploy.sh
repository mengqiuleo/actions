docker pull actions-images:latest
docker stop actions
docker rm actions
docker run --name actions -d -p 5555:80 actions-images:latest
docker image prune -f
docker container prune -f

