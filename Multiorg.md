# Multiorg


Start the fabric

start.sh in the network directory

start the clis (had to adjust the directory of the crypto-config one level different)


--collections-config

peer chaincode install -n papercontract -v 0 -p /opt/gopath/src/github.com/contract -l node

export ORDERER_CA=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/magnetocorp.example.com/orderers/orderer1.magnetocorp.example.com/msp/tlscacerts/tlsca.magnetocorp.example.com-cert.pem


peer chaincode instantiate -n papercontract -v 0 -l node -c '{"Args":["org.papernet.commercialpaper:instantiate"]}' -C papernet -P "AND ('magnetocorpMSP.member','digibankMSP.member')" --collections-config /opt/gopath/src/github.com/contract/collections_config.json --tls true --cafile $ORDERER_CA

peer chaincode instantiate -n papercontract -v 0 -l node -c '{"Args":["org.papernet.commercialpaper:instantiate"]}' -C papernet -P "OR ('magnetocorpMSP.member','digibankMSP.member')" --collections-config /opt/gopath/src/github.com/contract/collections_config.json --tls true --cafile $ORDERER_CA

peer chaincode upgrade -n papercontract -v 1 -l node -c '{"Args":["org.papernet.commercialpaper:instantiate"]}' -C papernet  --tls true --cafile $ORDERER_CA

peer chaincode query -n papercontract -c '{"Args":["org.hyperledger.fabric:GetMetadata"]}' -C papernet --tls true --cafile $ORDERER_CA


discover  --userKey=./crypto/peerOrganizations/digibank.example.com/users/Admin\@digibank.example.com/msp/keystore/9fbcaac2843325754967677da6e2b716835cecc54610a2fcc60c9b5fcabbb713_sk --userCert=./crypto/peerOrganizations/digibank.example.com/users/Admin\@digibank.example.com/msp/signcerts/Admin\@digibank.example.com-cert.pem --peerTLSCA=./crypto/peerOrganizations/digibank.example.com/peers/peer5.digibank.example.com/tls/ca.crt  peers --server=peer5.digibank.example.com:8051 --channel=papernet --MSP=digibankMSP



   --tlsKey=./crypto/peerOrganizations/digibank.example.com/users/Admin\@digibank.example.com/msp/keystore/9fbcaac2843325754967677da6e2b716835cecc54610a2fcc60c9b5fcabbb713_sk --tlsCert=./crypto/peerOrganizations/digibank.example.com/users/Admin\@digibank.example.com/msp/signcerts/Admin\@digibank.example.com-cert.pem