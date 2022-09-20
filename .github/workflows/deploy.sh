
docker pull mengqiuleo/actions-image:latest


docker stop actions


docker rm actions
docker rmi mengqiuleo/actions-image:latest


docker run --name actions -d -p 5555:80 mengqiuleo/actions-image:latest


# docker image prune -f
# docker container prune -f



