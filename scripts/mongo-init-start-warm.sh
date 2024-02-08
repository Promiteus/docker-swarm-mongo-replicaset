#!/bin/bash

name=""
name=$(docker container ls | awk '{print $NF}' | grep rep_mongo1)
echo $name

docker exec -it $name bash -c "sh /etc/init-user.sh"