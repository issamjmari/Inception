#!/bin/sh

docker rm $(docker ps -aq) -f
docker rmi $(docker images -qa) -f
docker volume prune --force << END
y
END
docker network prune << END
y
END
docker system prune -all << END
y
END