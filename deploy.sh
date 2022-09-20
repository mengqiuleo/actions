docker pull actions-images
docker stop actions
docker rm actions
docker run --name actions -d -p 5555:80 actions-images
docker image prune -f
docker container prune -f

