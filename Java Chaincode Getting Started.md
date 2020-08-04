
### Clone the example repository locally:
```
git clone https://github.com/ampretia/fabric-application-examples.git
```

We'll be using the very latest Fabric v2.0.0-alpha images - so we need to get these, first the very latest docker images, and then the binaries

```
cd fabric-application-examples/infrastructure
curl -sSL http://bit.ly/2ysbOFE | bash -s --  2.0.0-alpha 2.0.0-alpha 0.4.15 -s -d
```

For even more cutting edge images that the alpha, use the script `./getEdgeFabricDocker.sh` to get the docker images.

### Start as very basic Fabric topology - in a console window that you can leave open monitoring the docker images

```
cd basic-network
./generate.sh
./start.sh
./monitordocker.sh
```

### Build the Java Contract APIs and Docker container

In a different window and fabric-chaincode-java directory
```
git fetch https://gerrit.hyperledger.org/r/fabric-chaincode-java refs/changes/78/28978/14 && git cherry-pick FETCH_HEAD
git fetch https://gerrit.hyperledger.org/r/fabric-chaincode-java refs/changes/80/30980/1 && git checkout FETCH_HEAD
./gradlew :fabric-chaincode-shim:classes :fabric-chaincode-shim:install 
./gradlew fabric-chaincode-docker:buildImage  
# get a cup of tea
```

[first is the implementations, second some fixes on top those]

### Build the java contract:

```
cd ../../contracts/java-contract
./gradlew clean build shadowJar
```
/opt/gopath/src/github.com/fabcar/javascript
### Deploy the Smart Contract

```
docker exec -it cli bash
peer lifecycle chaincode package pc0.tar.gz --path /opt/gopath/src/github.com/contracts/java-contract/ --lang java --label pc_0
peer lifecycle chaincode install pc0.tar.gz
export CC_PACKAGE_ID=$(peer lifecycle chaincode queryinstalled 2>&1 | awk -F "[, ]+" '/Label: /{print $3}') && echo $CC_PACKAGE_ID
peer lifecycle chaincode approveformyorg --channelID mychannel --name pc_0 --version 0.0.3 --package-id $CC_PACKAGE_ID --sequence 1 --waitForEvent
peer lifecycle chaincode approveformyorg --channelID mychannel --name pc_0 --version 0.0.3 --package-id $CC_PACKAGE_ID --sequence 1 --waitForEvent
peer lifecycle chaincode commit -o orderer.example.com:7050 --channelID mychannel --name pc_0 --version 0.0.3 --sequence 1 --waitForEvent
```

You can now invoke the tranasction functionscd 
```
peer chaincode invoke -o orderer.example.com:7050 --channelID mychannel --name pc_0 --version 0.0.3 -c '{"Args":["GreetingContract:setupledger"]}'
```


----
## Cheat Sheet for sequence of commands for v2.0 lifecycle and byfn

docker kill $(docker ps -q) && docker rm $(docker ps -aq)  
docker rmi $(docker images dev-* -q) --force
docker volume prune -f && docker network prune -f
./byfn.sh generate
./byfn.sh restart

# org1 ->
docker exec -it cli bash

# org2 ->
docker exec -it Org2cli bash


# In Org1 and Org2
export ORDERER_CA=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem
export TARGETTED_PEERS="--peerAddresses peer0.org1.example.com:7051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt --peerAddresses peer0.org2.example.com:9051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt" 
export CC_PATH=/opt/gopath/src/github.com/hyperledger/fabric-samples/chaincode/fabcar/javascript


For CP
export TARGETTED_PEERS="--peerAddresses peer0.magnetocorp.example.com:7051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/magnetocorp.example.com/peers/peer0.magnetocorp.example.com/tls/ca.crt"

# In Org1
peer lifecycle chaincode package fabcar_i0.tar.gz --path ${CC_PATH} --lang node --label fabcar_i0


# In both Org1 and Org2
peer lifecycle chaincode install fabcar_i0.tar.gz --connTimeout 60s
export CC_PACKAGE_ID=$(peer lifecycle chaincode queryinstalled 2>&1 | awk -F "[, ]+" '/Label: fabcar_i0/{print $3}') && echo $CC_PACKAGE_ID

export CC_PACKAGE_ID=$(peer lifecycle chaincode queryinstalled --output json | jq '.installed_chaincodes[] | select(.label=="basic_java") | .package_id' -r) && echo $CC_PACKAGE_ID

peer lifecycle chaincode approveformyorg --channelID mychannel --name pc_0 --version 0.0.3 --package-id $CC_PACKAGE_ID --sequence 1 --waitForEvent --cafile $ORDERER_CA 

peer lifecycle chaincode approveformyorg --channelID mychannel --name pc_0 --version 0.0.3 --package-id $CC_PACKAGE_ID --sequence 1 --waitForEvent --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA 

# In Org1
peer lifecycle chaincode commit -o orderer.example.com:7050 --channelID mychannel --name pc_0 --version 0.0.3 --sequence 1 --waitForEvent --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA ${TARGETTED_PEERS}
peer lifecycle chaincode commit -o orderer.example.com:7050 --channelID mychannel --name pc_0 --version 0.0.3 --sequence 1 --waitForEvent --cafile $ORDERER_CA --peerAddresses peer0.org1.example.com:7051 
# In either org ->
peer chaincode query -o orderer.example.com:7050 --channelID mychannel --name pc_0 -c '{"Args":["org.hyperledger.fabric:GetMetadata"]}' --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA | jq

# In either org ->
peer chaincode invoke -o orderer.example.com:7050 --channelID mychannel --name pc_0 -c '{"Args":["initLedger"]}' --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA --waitForEvent ${TARGETTED_PEERS} 

# In either org ->
peer chaincode query -o orderer.example.com:7050 --channelID mychannel --name pc_0 -c '{"Args":["queryAllCars"]}' --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA | jq 'fromjson'

--------

peer lifecycle chaincode package basic_java.tar.gz --path ${CC_PATH} --lang java --label basic_java
export CC_PACKAGE_ID=$(peer lifecycle chaincode queryinstalled --output json | jq '.installed_chaincodes[] | select(.label=="basic_java") | .package_id' -r) && echo $CC_PACKAGE_ID
export CC_PATH=/opt/gopath/src/github.com/basic-contract/ledger-contract




docker kill $(docker ps -q) && docker rm $(docker ps -aq)  
docker rmi $(docker images dev-* -q) --force
docker volume prune -f && docker network prune -f

./start.sh

java -jar build/libs/chaincode.jar -i jc@1 --peer.address localhost:7052
CORE_CHAINCODE_LOGGING_SHIM=debug fabric-chaincode-node start --peer.address=localhost:7052 --chaincode-id-name hellonet:1"

export CORE_CHAINCODE_LOGGING_SHIM=debug
export CORE_CHAINCODE_LOGGING_LEVEL=debug
docker exec -it cli bash
# absolute paths ONLY

peer chaincode install -n jc -v 1 -p $(pwd)/java-contract -l java
peer chaincode instantiate -n jc -v 1 -l java -c '{"Args":[]}' -C mychannel -P "AND ('Org1MSP.member')"

peer chaincode invoke -o orderer.example.com:7050 --channelID mychannel --name jc -c '{"Args":["hello"]}'
peer chaincode invoke -o orderer.example.com:7050 --channelID mychannel --name jc -c '{"Args":["createMyAsset","fred","person"]}'
peer chaincode invoke -o orderer.example.com:7050 --channelID mychannel --name jc -c '{"Args":["readMyAsset","fred","person"]}'
./gradlew build shadowJar && java -jar build/libs/chaincode.jar -i jc:1 --peer.address localhost:7052


So if despite the number of threads in the pool, throughput is the same, there's another bottlenexk somewhere


docker-compose -f ./docker-compose-cli.yaml up -d peer0.org1.example.com peer1.org1.example.com peer0.org2.example.com peer1.org2.example.com orderer.example.com
docker-compose -f ./docker-compose-cli.yaml up cli

docker-compose -f ./docker-compose-cli.yaml run --entrypoint bash cli 
docker-compose -f ./docker-compose-cli.yaml down

peer chaincode install -n javacc -v 1.0 -p /opt/gopath/src/github.com/hyperledger/fabric/peer/chaincodes/sacc -l java
peer chaincode instantiate -n javacc -v 1.0 -l java -c '{"Args":["init","a","100"]}' -C mychannel -P "OR ('Org1MSP.member','Org2MSP.member')"

peer chaincode invoke -o orderer.example.com:7050 -C mychannel -n mycc --peerAddresses peer0.org1.example.com:7051 --peerAddresses peer0.org2.example.com:7051 -c '{"Args":["set","a","10"]}'

peer chaincode invoke -o orderer.example.com:7050 -C mychannel -n mycc --peerAddresses peer0.org1.example.com:7051 --peerAddresses peer0.org2.example.com:7051 -c '{"Args":["get","a"]}'
```

{
  "annotations": {
    "list": [
      {
        "builtIn": 1,
        "datasource": "-- Grafana --",
        "enable": true,
        "hide": true,
        "iconColor": "rgba(0, 211, 255, 1)",
        "name": "Annotations & Alerts",
        "type": "dashboard"
      }
    ]
  },
  "editable": true,
  "gnetId": null,
  "graphTooltip": 0,
  "id": 3,
  "links": [],
  "panels": [
    {
      "cacheTimeout": null,
      "colorBackground": false,
      "colorValue": false,
      "colors": [
        "#299c46",
        "rgba(237, 129, 40, 0.89)",
        "#d44a3a"
      ],
      "format": "none",
      "gauge": {
        "maxValue": 100,
        "minValue": 0,
        "show": false,
        "thresholdLabels": false,
        "thresholdMarkers": true
      },
      "gridPos": {
        "h": 2,
        "w": 2,
        "x": 0,
        "y": 0
      },
      "id": 14,
      "interval": null,
      "links": [],
      "mappingType": 1,
      "mappingTypes": [
        {
          "name": "value to text",
          "value": 1
        },
        {
          "name": "range to text",
          "value": 2
        }
      ],
      "maxDataPoints": 100,
      "nullPointMode": "connected",
      "nullText": null,
      "options": {},
      "postfix": "",
      "postfixFontSize": "50%",
      "prefix": "",
      "prefixFontSize": "50%",
      "rangeMaps": [
        {
          "from": "null",
          "text": "N/A",
          "to": "null"
        }
      ],
      "sparkline": {
        "fillColor": "rgba(31, 118, 189, 0.18)",
        "full": false,
        "lineColor": "rgb(31, 120, 193)",
        "show": false,
        "ymax": null,
        "ymin": null
      },
      "tableColumn": "",
      "targets": [
        {
          "expr": "tx_max_pool_size",
          "refId": "A"
        }
      ],
      "thresholds": "",
      "timeFrom": null,
      "timeShift": null,
      "title": "Max Pool Size",
      "type": "singlestat",
      "valueFontSize": "80%",
      "valueMaps": [
        {
          "op": "=",
          "text": "N/A",
          "value": "null"
        }
      ],
      "valueName": "current"
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "fill": 1,
      "fillGradient": 0,
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 4,
        "y": 0
      },
      "id": 6,
      "legend": {
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "nullPointMode": "null",
      "options": {
        "dataLinks": []
      },
      "percentage": false,
      "pointradius": 2,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "tx_active_count",
          "instant": false,
          "refId": "A"
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeRegions": [],
      "timeShift": null,
      "title": "Thread Pool Active Count",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "decimals": null,
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": "10",
          "min": "0",
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "cacheTimeout": null,
      "colorBackground": false,
      "colorValue": false,
      "colors": [
        "#299c46",
        "rgba(237, 129, 40, 0.89)",
        "#d44a3a"
      ],
      "format": "none",
      "gauge": {
        "maxValue": 100,
        "minValue": 0,
        "show": false,
        "thresholdLabels": false,
        "thresholdMarkers": true
      },
      "gridPos": {
        "h": 2,
        "w": 2,
        "x": 0,
        "y": 2
      },
      "id": 12,
      "interval": null,
      "links": [],
      "mappingType": 1,
      "mappingTypes": [
        {
          "name": "value to text",
          "value": 1
        },
        {
          "name": "range to text",
          "value": 2
        }
      ],
      "maxDataPoints": 100,
      "nullPointMode": "connected",
      "nullText": null,
      "options": {},
      "postfix": "",
      "postfixFontSize": "50%",
      "prefix": "",
      "prefixFontSize": "50%",
      "rangeMaps": [
        {
          "from": "null",
          "text": "N/A",
          "to": "null"
        }
      ],
      "sparkline": {
        "fillColor": "rgba(31, 118, 189, 0.18)",
        "full": false,
        "lineColor": "rgb(31, 120, 193)",
        "show": false,
        "ymax": null,
        "ymin": null
      },
      "tableColumn": "",
      "targets": [
        {
          "expr": "tx_pool_size",
          "refId": "A"
        }
      ],
      "thresholds": "",
      "timeFrom": null,
      "timeShift": null,
      "title": "Pool Size",
      "type": "singlestat",
      "valueFontSize": "80%",
      "valueMaps": [
        {
          "op": "=",
          "text": "N/A",
          "value": "null"
        }
      ],
      "valueName": "current"
    },
    {
      "cacheTimeout": null,
      "colorBackground": false,
      "colorValue": false,
      "colors": [
        "#299c46",
        "rgba(237, 129, 40, 0.89)",
        "#d44a3a"
      ],
      "format": "none",
      "gauge": {
        "maxValue": 100,
        "minValue": 0,
        "show": false,
        "thresholdLabels": false,
        "thresholdMarkers": true
      },
      "gridPos": {
        "h": 2,
        "w": 2,
        "x": 0,
        "y": 4
      },
      "id": 10,
      "interval": null,
      "links": [],
      "mappingType": 1,
      "mappingTypes": [
        {
          "name": "value to text",
          "value": 1
        },
        {
          "name": "range to text",
          "value": 2
        }
      ],
      "maxDataPoints": 100,
      "nullPointMode": "connected",
      "nullText": null,
      "options": {},
      "postfix": "",
      "postfixFontSize": "50%",
      "prefix": "",
      "prefixFontSize": "50%",
      "rangeMaps": [
        {
          "from": "null",
          "text": "N/A",
          "to": "null"
        }
      ],
      "sparkline": {
        "fillColor": "rgba(31, 118, 189, 0.18)",
        "full": false,
        "lineColor": "rgb(31, 120, 193)",
        "show": false,
        "ymax": null,
        "ymin": null
      },
      "tableColumn": "",
      "targets": [
        {
          "expr": "tx_core_pool_size",
          "refId": "A"
        }
      ],
      "thresholds": "",
      "timeFrom": null,
      "timeShift": null,
      "title": "Core Pool Size",
      "type": "singlestat",
      "valueFontSize": "80%",
      "valueMaps": [
        {
          "op": "=",
          "text": "N/A",
          "value": "null"
        }
      ],
      "valueName": "current"
    },
    {
      "cacheTimeout": null,
      "colorBackground": false,
      "colorValue": false,
      "colors": [
        "#299c46",
        "#FF9830",
        "#d44a3a"
      ],
      "decimals": null,
      "format": "none",
      "gauge": {
        "maxValue": 100,
        "minValue": 0,
        "show": false,
        "thresholdLabels": false,
        "thresholdMarkers": true
      },
      "gridPos": {
        "h": 2,
        "w": 2,
        "x": 0,
        "y": 6
      },
      "id": 4,
      "interval": null,
      "links": [],
      "mappingType": 1,
      "mappingTypes": [
        {
          "name": "value to text",
          "value": 1
        },
        {
          "name": "range to text",
          "value": 2
        }
      ],
      "maxDataPoints": 100,
      "nullPointMode": "connected",
      "nullText": null,
      "options": {},
      "postfix": "",
      "postfixFontSize": "50%",
      "prefix": "",
      "prefixFontSize": "50%",
      "rangeMaps": [
        {
          "from": "null",
          "text": "N/A",
          "to": "null"
        }
      ],
      "sparkline": {
        "fillColor": "rgba(31, 118, 189, 0.18)",
        "full": false,
        "lineColor": "rgb(31, 120, 193)",
        "show": false,
        "ymax": null,
        "ymin": null
      },
      "tableColumn": "",
      "targets": [
        {
          "expr": "tx_task_count{job=\"matthew-VirtualBox_null\"}",
          "instant": true,
          "refId": "A"
        }
      ],
      "thresholds": "",
      "timeFrom": null,
      "timeShift": null,
      "title": "Task Count",
      "type": "singlestat",
      "valueFontSize": "80%",
      "valueMaps": [
        {
          "op": "=",
          "text": "N/A",
          "value": "null"
        }
      ],
      "valueName": "current"
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "fill": 1,
      "fillGradient": 0,
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 4,
        "y": 8
      },
      "id": 8,
      "legend": {
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "nullPointMode": "null",
      "options": {
        "dataLinks": []
      },
      "percentage": false,
      "pointradius": 2,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "tx_largest_pool_size",
          "refId": "A"
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeRegions": [],
      "timeShift": null,
      "title": "Largest Thread Pool",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    }
  ],
  "refresh": false,
  "schemaVersion": 19,
  "style": "dark",
  "tags": [],
  "templating": {
    "list": []
  },
  "time": {
    "from": "now-6h",
    "to": "now"
  },
  "timepicker": {
    "refresh_intervals": [
      "5s",
      "10s",
      "30s",
      "1m",
      "5m",
      "15m",
      "30m",
      "1h",
      "2h",
      "1d"
    ]
  },
  "timezone": "",
  "title": "New dashboard Copy",
  "uid": "LUcoORcWz",
  "version": 3
}
```