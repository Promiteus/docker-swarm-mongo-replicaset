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
* В manager машине обновить метки узлов:
```
docker node update --label-add mongo.replica=1 *manager-address*
docker node update --label-add mongo.replica=2 *worker1-address*
docker node update --label-add mongo.replica=3 *worker2-address*
```
Для multipass "manager-address" нужно использовать имя узла (anager, vm-1, vm-2 и т.д.).  

* Запустить сервисы mongodb в manager узле:
```
docker stack deploy -c docker-stack.yml rep
```
### 2. Инициализировать мастер базу и задать параметры входа
* Инициализация мастер-базы (manager узел), команды по порядку:
> ./scripts/init-master-db.sh  
* Открыть публичные порты:  
> docker service update --publish-add 27017:27017 rep_mongo1  
* Инициализировать пользователя:  
> ./scripts/mongo-init-user.sh  





