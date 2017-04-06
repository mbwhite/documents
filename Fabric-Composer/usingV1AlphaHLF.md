

1. Clone the fabric composer repo as we need to use a number of the scripts from the system tests
2. Clone the getting stated repository (as per normal)
3. Install the composer-cli commands
4. Pull down the HLFv1 Docker images
```
docker pull hyperledger/fabric-peer:x86_64-1.0.0-alpha
docker pull hyperledger/fabric-ca:x86_64-1.0.0-alpha
docker pull hyperledger/fabric-ccenv:x86_64-1.0.0-alpha
docker pull hyperledger/fabric-orderer:x86_64-1.0.0-alpha
docker pull hyperledger/fabric-couchdb:x86_64-1.0.0-alpha
```
5. Navigate to `~/github/fabric-composer/packages/composer-systests/hlfv1`
6. Issue these docker-compose commands     
```
docker-compose -f hlfv1_alpha-docker-compose.yml kill
docker-compose -f hlfv1_alpha-docker-compose.yml down
docker-compose -f hlfv1_alpha-docker-compose.yml up -d
```
7. 
