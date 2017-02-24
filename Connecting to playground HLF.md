# Using the Fabric Composer Playground with applications

The [Fabric Composer playground](https://fabric-composer.github.io/start/getting-started-playground.html) docker image is a great way to get started with modelling your business network using the web UI. The docker-compose script also starts up the Docker version of the Hyperledger Fabric. 

A next step that many people want to try is using the same deployed network and running Fabric and connect applications to it, either REST or simple command line applications. Or simply try out the Fabric Composer Command line.

The current version of the Hyperledger Fabric used by Fabric Composer is v0.6; work is underway to move to v1 of Hyperledger Fabric. This will allow a number of new features and remove some limitations/problems today. 

One problem today is that the 'chaincode id' needs to be available to all applications; this is stored  in a folder that is created in the users home directory, and critically, *where the Business Network Definition was deployed from*.  

In the scenario, like with the Playground, the Business Network Definition is deployed within the Docker container running the UI. Applications running on the command line outside these docker containers are going to struggle to get acces.

## Solution
*Note this is only a solution for current versions - and not anything that would permitted post v1 or in production*

* The 'Admin' Indentity is used in the Playground UI. For testing this could be used but ideally a new participant and indentity should be created. 
* There are two directories that need to be copied - /home/composer/.composer-connection-profiles and the /home/composer/.composer-credentials directories
* Get these files from the Running docker container and copy them to a local temporary directory and make some minor changes to the host and path names

###Steps

0. Assuming that the playground docker images have been started and the deploy has occured by visiting localhost:8080
1. Look at the running docker images to find the one that deployed the network.
```
$ docker ps
CONTAINER ID        IMAGE                                                                      COMMAND                  CREATED             STATUS              PORTS                              NAMES
23d430fba858        dev-vp0-186e6b0b799dfc29371d30fa85a7a5eb781045461f3bf7ff363ff73fa35168d3   "/opt/gopath/bin/1..."   19 seconds ago      Up 18 seconds                                          dev-vp0-186e6b0b799dfc29371d30fa85a7a5eb781045461f3bf7ff363ff73fa35168d3
3e85dde8914d        fabriccomposer/composer-ui                                                 "pm2-docker compos..."   29 hours ago        Up 2 minutes        0.0.0.0:8080->8080/tcp             carauctionrest_composer_1
54124045d5a3        hyperledger/fabric-peer:x86_64-0.6.1-preview                               "sh -c 'sleep 5; p..."   29 hours ago        Up 2 minutes        0.0.0.0:7050-7053->7050-7053/tcp   carauctionrest_vp0_1
005f66a6c8dc        hyperledger/fabric-membersrvc:x86_64-0.6.1-preview                         "membersrvc"             29 hours ago        Up 2 minutes        0.0.0.0:7054->7054/tcp             carauctionrest_membersrvc_1

```
The container of interest is the `fabriccomposer/composer-ui` one. Note the Container ID as well for this - it will be used later. (it is possible the id will be different on your system). In a working directory locally issue the following commands to copy files out of this docker container (for this example we're using  `/home/matthew/git-lenny`).

```
docker cp 3e85dde8914d:/home/composer/.composer-credentials/ .
docker cp 3e85dde8914d:/home/composer/.composer-connection-profiles/ .
```

A `ls -aR` will show all the files locally that have been copied.

```
$ ls -aR
.:
.  ..  .composer-connection-profiles  .composer-credentials

./.composer-connection-profiles:
.  ..  hlfabric

./.composer-connection-profiles/hlfabric:
.  ..  connection.json

./.composer-credentials:
.  ..  member.admin  
```

2. Change to your local `.composer-connection-profiles` directory and create a new connection profile

```
$ cd ~/.composer-connection-profiles
$ mkdir playgroundFabric-profile
$ cd ~/.composer-connection-profiles
```

3. Copy the `connection.json` from the profile that was copied out of docker

```
cp ~/git-lenny/.composer-connection-profiles/hlfabric/connection.json  .
$ more connection.json 
{
    "type": "hlf",
    "keyValStore": "/home/composer/.composer-credentials",
    "membershipServicesURL": "grpc://membersrvc:7054",
    "peerURL": "grpc://vp0:7051",
    "eventHubURL": "grpc://vp0:7053",
    "deployWaitTime": 300,
    "invokeWaitTime": 30,
    "networks": {
        "org.acme.biznet": "186e6b0b799dfc29371d30fa85a7a5eb781045461f3bf7ff363ff73fa35168d3"
    }
}
````

The are a few things to change here (1) all the hostnames should be localhost `grpc://localhost:7054` for example (2) the keyValStore needs to point the `.composer-credentials` directory that was copied over. In this example that was copied to the ~/git-lenny directory

```
$ more connection.json 
{
    "type": "hlf",
    "keyValStore": "/home/matthew/git-lenny/.composer-credentials",
    "membershipServicesURL": "grpc://localhost:7054",
    "peerURL": "grpc://localhost:7051",
    "eventHubURL": "grpc://localhost:7053",
    "deployWaitTime": 300,
    "invokeWaitTime": 30,
    "networks": {
        "org.acme.biznet": "186e6b0b799dfc29371d30fa85a7a5eb781045461f3bf7ff363ff73fa35168d3"
    }
}
```

## Running a test command
Now the connection profile is setup and pointing to the correct credentials. Commands can be issed. 

```
$ composer network list -n org.acme.biznet -i admin -s Xurw3yU9zI0l --connectionProfileName playgroundFabric-profile
List business network org.acme.biznet
name:        org.acme.biznet
identifier:  org.acme.biznet@0.0.1
description: Acme Business Network
models: 
  - org.acme.vehicle.auction
scripts: 
  - lib/logic.js
registries: 
  org.acme.vehicle.auction.VehicleListing: 
    id:           org.acme.vehicle.auction.VehicleListing
    name:         Asset registry for org.acme.vehicle.auction.VehicleListing
    registryType: Asset
    assets: 
  org.acme.vehicle.auction.Vehicle: 
    id:           org.acme.vehicle.auction.Vehicle
    name:         Asset registry for org.acme.vehicle.auction.Vehicle
    registryType: Asset
    assets: 
Command completed successfully.

```
