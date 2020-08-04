version 2 Fabric Lifecycle 
Commercial Paper step-by-step

peer lifecycle chaincode package pc0.tar.gz --path /opt/gopath/src/github.com/hyperledger/fabric-samples/chaincode/fabcar/javascript --lang node --label pc_0
peer lifecycle chaincode install pc0.tar.gz


export ORDERER_CA=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem 
peer lifecycle chaincode approveformyorg --channelID mychannel -name papercontract -v 0 --package-id $CC_PACKAGE_ID --sequence 1 --policy "AND ('Org1MSP.member')" --waitForEvent --tls --cafile $ORDERER_CA

export ORDERER_CA=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/magnetocorp.example.com/orderers/orderer1.magnetocorp.example.com/msp/tlscacerts/tlsca.magnetocorp.example.com-cert.pem

peer lifecycle chaincode package pc0.tar.gz --path /opt/gopath/src/github.com/contract --lang node --label pc_0
peer lifecycle chaincode install pc0.tar.gz
peer lifecycle chaincode approveformyorg --channelID $CHANNEL_NAME --name papercontract -v 0 --package-id $CC_PACKAGE_ID --sequence 1 --policy "AND ('Org1MSP.member')" --waitForEvent --tls --cafile ${ORDERER_CA}

peer lifecycle chaincode commit -o orderer1.magnetocorp.example.com:7050  --channelID $CHANNEL_NAME --name mycc --version 1.0 --sequence 1 --init-required --tls true --cafile $ORDERER_CA --waitForEvent --peerAddresses peer1.magnetocorp.example.com:7051 --tlsRootCertFiles  /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/magnetocorp.example.com/peers/peer1.magnetocorp.example.com/tls/ca.crt  --peerAddresses peer5.digibank.example.com:8051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/digibank.example.com/peers/peer5.digibank.example.com/tls/ca.crt

peer chaincode invoke -o orderer1.magnetocorp.example.com:7050 --isInit --tls true --cafile $ORDERER_CA -C $CHANNEL_NAME -n mycc --peerAddresses peer1.magnetocorp.example.com:7051 --tlsRootCertFiles  /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/magnetocorp.example.com/peers/peer1.magnetocorp.example.com/tls/ca.crt  --peerAddresses peer5.digibank.example.com:8051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/digibank.example.com/peers/peer5.digibank.example.com/tls/ca.crt  -c '{"Args":"Init","a","100","b","100"]}'


peer chaincode install -n java-helloworld -v 0.0.3 -p /opt/gopath/src/github.com/contracts/java-contract/ -l java
peer chaincode instantiate  -n java-helloworld -v 0.0.3 -l java -c '{"Args":["GreetingContract:instantiate"]}' -C mychannel  

peer lifecycle chaincode package pc0.tar.gz --path /opt/gopath/src/github.com/contracts/java-contract/ --lang java --label pc_0
peer lifecycle chaincode install pc0.tar.gz
export CC_PACKAGE_ID=$(peer lifecycle chaincode queryinstalled 2>&1 | awk -F "[, ]+" '/Label: /{print $3}')
peer lifecycle chaincode approveformyorg --channelID mychannel --name pc_0 --version 0.0.3 --package-id $CC_PACKAGE_ID --sequence 1 --waitForEvent
peer lifecycle chaincode commit -o orderer.example.com:7050 --channelID mychannel --name pc_0 --version 0.0.3 --sequence 1 --waitForEvent
peer chaincode invoke -o orderer.example.com:7050 --channelID mychannel --name pc_0 --version 0.0.3 -c '{"Args":[
   GreetingContract:setupledger"]}'

#!/bin/bash

# This script uses the logspout and http stream tools to let you watch the docker containers
# in action.
#
# More information at https://github.com/gliderlabs/logspout/tree/master/httpstream
NETWORKS=$(docker network ls --filter driver=bridge --format {{.Name}})
if [ -z "$1" ]; then
   select DOCKER_NETWORK in ${NETWORKS}  
   do 
     break 
   done
else 
   DOCKER_NETWORK="$1"
fi

echo Starting monitoring on all containers on the network ${DOCKER_NETWORK}   

docker kill logspout 2> /dev/null 1>&2 || true
docker rm logspout 2> /dev/null 1>&2 || true

docker run -d --name="logspout" \
	--volume=/var/run/docker.sock:/var/run/docker.sock \
	--publish=127.0.0.1:8000:80 \
	--network  ${DOCKER_NETWORK} \
	gliderlabs/logspout  
sleep 3
curl http://127.0.0.1:8000/logs


https://github.com/mbwhite/fabric-chaincode-java/blob/ledger-api/examples/ledger-api-examples/src/main/java/fabcar/FabCar.java