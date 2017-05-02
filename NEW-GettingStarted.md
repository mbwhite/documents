# Hyperledger Composer Getting Started

Follow the instructions below to get started by standing up a Hyperledger Fabric, and then getting a simple Hyperledger Composer Business Network deployed and an application running against it. 

There are two version of Hyperledger Fabric : v0.6 and v1.0-alpha.  The default is for v1.0-alpha and we suggest this is the one you use.

## Step 1: Getting Hyperledger Fabric running

1. Clone the `fabric-dev-servers` git repo for the helper scripts to get Fabric running for development use
```
$ git clone git@github.com:mbwhite/fabric-dev-servers.git
```
2. Choose which version of Fabric to use. For v0.6
```
$ npm set fabric-dev-servers:fabricversion hlfv0.6
```

For v1.0-alpha, there is nothing to as this the default. But to 'unset' the v0.6, or to be explicit use this command

```
$ npm set fabric-dev-servers:fabricversion hlfv1
```

3. Setup the required depenendancies
```
$ npm install
```

4. This repository and it's scripts are ready to go! If this is the first time, you'll need to download the fabric, start the fabric, and create a Composer profile.  After that you can then choose to either stop the fabric, and start it again later. Alternatively to completely clean up you can teardown the Fabric and the Composer profile. 

*If you want to swap between v0.6 and v1.0, ensure you have issued a STOP and a TEARDOWN command first be START on the other version*

### Downloading Fabric

Issue _one_ of these commands from the `fabric-dev-servers` directory
```
$ ./download.sh
$ npm run download
```

### Starting Fabric

Issue _one_ of these commands from the `fabric-dev-servers` directory
```
$ ./start.sh
$ npm start
```

### Stop Fabric

Issue _one_ of these commands from the `fabric-dev-servers` directory
```
$ ./stop.sh
$ npm stop
```

### Create Composer Profile

Issue _one_ of these commands from the `fabric-dev-servers` directory
```
$ ./createComposerProfile.sh
$ npm run createComposerProfile
```

Note: this create a Hyperledger Composer profile specifically to connect to the development fabric you've already started. 

### Teardown Fabric

Issue _one_ of these commands from the `fabric-dev-servers` directory
```
$ ./teardown.sh
$ npm run teardown
```
Note: this removes the Composer profile for the currently specific version of the Fabric
