#! /bin/sh

docker-compose down
docker system prune -f
docker volume prune -f
rm -f .webapps/*.war

