

https://github.com/hyperledger/fabric/releases/download/v1.4.4/hyperledger-fabric-linux-amd64-1.4.4.tar.gz

curl -sSL http://bit.ly/2ysbOFE  > bootstrap.sh
./bootstrap.sh -s -d



docker kill $(docker ps -q) && docker rm $(docker ps -aq) 
docker rmi $(docker images  -q) --force     
docker volume prune -f && docker network prune -f




```
./byfn.sh up  -a -n -s couchdb    