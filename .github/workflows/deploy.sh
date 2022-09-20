
docker pull mengqiuleo/actions-image:latest


docker stop actions


docker rm actions
docker rmi mengqiuleo/actions-image:latest


docker run -d -p 5555:80 --name actions mengqiuleo/actions-image:latest


# docker image prune -f
# docker container prune -f



