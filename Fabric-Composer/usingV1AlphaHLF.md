# Getting Started on HLFv1 with 'leading-edge' Composer

1. Clone the fabric composer repo as we need to use a number of the scripts from the system tests
```
$ cd ~/github
$ git clone git@github.com:fabric-composer/fabric-composer.git
$ cd fabric-composer
$ npm install
```

2. Install the composer-cli commands... locally I was testing using the copy of fabric-composer I had from git hence these `npm link` steps are important so the very latest code is being used.
```
$ cd ~/github/fabric-composer/packages
$ cd composer-cli && npm link
$ cd ../composer-client && npm link
$ cd ../composer-admin && npm link
```

3. Clone the getting stated repository (as per normal)
```
$ cd ~/github
$ git clone git@github.com:fabric-compose/sample-applications.git
$ cd sample-applications/packages/getting-started
$ npm link composer-client
$ npm link composer-admin
```

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
7. Two additional admin steps are now needed for the HLFv1 images.
```
$ SYSTEST=hlfv1 node create-channel.js
$ SYSTEST=hlfv1 node join-channel.js
```
8. Create the connection profile for v1
```
$ cd ~/.composer-connection-profiles
$ mkdir hlfv1
$ touch hlfv1/connection.json
```
In the `connection.json` just created add the following - note the path for key val store should change to match your home directory
```
{
    "type": "hlfv1",
    "orderers": [
        "grpc://localhost:7050"
    ],
    "ca": "https://localhost:7054",
    "peers": [
        {
            "requestURL": "grpc://localhost:7051",
            "eventURL": "grpc://localhost:7053"
        },
        {
            "requestURL": "grpc://localhost:7056",
            "eventURL": "grpc://localhost:7058"
        }
    ],
    "keyValStore": "/home/matthew/.hfc-key-store",
    "channel": "mychannel",
    "mspID": "Org1MSP",
    "deployWaitTime": "300",
    "invokeWaitTime": "100"
}
```

9. Different enrollment details are required. Update the `config/default.json` file in the getting started application
```
$ cd ~/github/sample-applications/packages/getting-started/config
```
This is what the file should be
```
{
  "gettingstarted": {
       "participantId" : "admin",
       "participantPwd" :"adminpw",
       "businessNetworkIdentifier" : "digitalproperty-network",
       "connectionProfile" :"hlfv1"
    }
}
```
10. At this point I than ran each step of the getting started app separately. But I won't document that here.. Instead load the `package.json` from getting started and alter the enrollment ID and enrollment secret to match the values in step 9.
```
$ cd ~/github/sample-applications/packages/getting-started
$ sed --in-place=ORIG 's/WebAppAdmin/admin/g' package.json
$ sed --in-place=ORIG 's/DJY27pEnl16d/adminpw/g' package.json
```
_might be worth double checking the file to make sure it's correct_

11. At this point getting started should be run as normal. `npm install` followed by `npm test`

:-)    


