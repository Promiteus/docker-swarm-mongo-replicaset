## Реплицируемый mongodb

ЦЕЛИ
1. Запустить реплицируемый deploy кластер из mongodb.
2. Инициализировать мастер базу и задать параметры входа.
3. Запустить админимтартивный deploy для просмотра и подключния к базе.

### 1. Создать реплицируемый кластер из mongodb
* Инициализировать кластер Swarm а manager узле:
```
docker swarm init
```
* Присоединить второй и третий узел, зайдя в них предварительно:
```
docker swarm join --token *docker-swarm-token* *manager-address*
```
* Создать общую сеть (manager узел):
```
docker network create -d overlay mongo-net
```