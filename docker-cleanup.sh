#!/bin/bash

set -e

printf 'clean up containers...'
docker ps -a | grep -v CONTAINER | awk '{print $1}' | xargs docker rm -f
printf '[OK]\n'

printf 'clean up images...'
docker images -a | grep -v IMAGE | awk '{print $3}' | xargs docker rmi -f
printf '[OK]\n'

printf 'clean up volumes...'
docker volume ls | grep -v DRIVER | awk '{print $2}' | xargs docker volume rm
printf '[OK]\n'
