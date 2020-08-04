# The Developers Reference to Smart Contracts 
The Hyperledger Fabric Version of course. In Java.

## Setup

- docker and docker-compose
- 

## Get the basics

Get the most up-to-date samples, cmd line tools, and docker images with 

```bash
wget -q https://raw.githubusercontent.com/hyperledger/fabric/master/scripts/bootstrap.sh
chmod +x bootstrap.sh

./bootstrap.sh
```

## Installation Verification Test

```bash
./network.sh up createChannel -ca -c mychannel -s couchdb
```

`-ca` and `-s couchdb` means uses a proper CA docker image for identities, and use couchdb for the peers to hold the current world state. Can do 'simpler' things here, but it's different from what you'd do in production, and doing it properly isn't really that much harder.

This starts the docker containers to represent a Two Organization Network. (Org1 and Org2 imaginatively).  It creates a channel 'mychannel' that both of these are members of. 

> It's the channel that is the *distributed ledger* that both Org1 and Org2 are using. 


```bash
./network.sh deployCC -l java
```


So now you've run the example, and want to make changes how?

Client applications can be modified and restarted; however the chaincode needs to have handled differently. 

Steps are

2. install on all org's peers
3. approve definition by all orgs
4. commit the definition to the channel - on 


peer lifecycle chaincode package cp.tar.gz --lang node --path ./contract --label cp_0
peer lifecycle chaincode install cp.tar.gz

peer lifecycle chaincode queryinstalled

export PACKAGE_ID=

peer lifecycle chaincode approveformyorg  --orderer localhost:7050 --ordererTLSHostnameOverride orderer.example.com --channelID mychannel --name fabcar -v 0 --init-required --package-id $PACKAGE_ID --sequence 1 --tls --cafile $ORDERER_CA

peer lifecycle chaincode checkcommitreadiness --channelID mychannel --name fabcar -v 0 --sequence 1

peer lifecycle chaincode commit -o localhost:7050 --peerAddresses localhost:7051 --tlsRootCertFiles ${PEER0_ORG1_CA} --peerAddresses localhost:9051 --tlsRootCertFiles ${PEER0_ORG2_CA} --ordererTLSHostnameOverride orderer.example.com --channelID mychannel --name fabcar -v 0 --sequence 1 --tls --cafile $ORDERER_CA  --init-required --waitForEvent 


