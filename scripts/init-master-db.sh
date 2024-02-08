#!/bin/bash

echo "Инициализация мастера mongo1"
replicate="rs.initiate(); sleep(1000); cfg = rs.conf(); cfg.members[0].host = \"mongo1:27017\"; rs.reconfig(cfg); rs.add({ host: \"mongo2:27017\", priority: 0.5 }); rs.add({ host: \"mongo3:27017\", priority: 0.5 }); rs.status();"
docker exec -it $(docker ps -qf label=com.docker.swarm.service.name=rep_mongo1) bash -c "echo '${replicate}' | mongo"