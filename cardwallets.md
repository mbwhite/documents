
Install the composer elements as LOCAL npm dependancies

```bash
npm install composer-cli@next-unstable composer-playground@next-unstable composer-rest-server@next-unstable  --save-dev
npm install composer-client@next-unstable --save
```
Get the latest fabric-tools.

```bash
mkdir fabric-tools
curl -O https://raw.githubusercontent.com/mbwhite/composer-tools/master/packages/fabric-dev-servers/fabric-dev-servers.zip
unzip fabric-dev-servers.zip -d fabric-tools

```
You can delete the zip file now if you wish.

Note that these are my current versions ahead of the PR going in

```bash
export HL_FABRIC_VERSION=hlfv11
export HL_COMPOSER_CLI=$(npm bin)/composer
```

Fabric can now be started and the peer admin card created. However before doing this, setup a NODE_CONFIG
parameter to use the first new feature - create the card store locally

```bash
export NODE_CONFIG='{"composer":{"wallet":{"type":"composer-wallet-filesystem","options":{"storePath":"./composer-store"}}}}'
```

If you have jq installed you can see this more clearly
```bash
$ echo $NODE_CONFIG | jq
{
"composer": {
"wallet": {
"type": "composer-wallet-filesystem",
"options": {
"storePath": "./composer-store"
}
}
}
}

```

You can check with tree that the card store is in the local directory.
There should NOT be anything in the usual ~/.composer directory

```bash
tree ./composer-store
./composer-store
├── cards
│   └── PeerAdmin@hlfv1
│       ├── connection.json
│       ├── credentials
│       │   ├── certificate
│       │   └── privateKey
│       └── metadata.json
└── client-data
└── PeerAdmin@hlfv1
├── 114aab0e76bf0c78308f89efc4b8c9423e31568da0c340ca187a9b17aa9a4457-priv
├── 114aab0e76bf0c78308f89efc4b8c9423e31568da0c340ca187a9b17aa9a4457-pub
└── PeerAdmin
```

To check using the composer card list  npx is the new npm v5 command to run the local installed modules commands

```bash
$ npx composer card list
```

----

ASIDE at this point you can do whatever you like with a network of your choice. And go off-piste if you wish


The key facts being... the NODE_CONFIG variable controls the config of where and what the implementation of the cardstore is.
This doesn't have to be a NODE_ENV variable but can be in a config\default.json file.

NODE_ENV can be used to control which file is picked up as well.

Next step would be to try the non-filesystem based solutions. They are temporarily at
https://hyperledger.github.io/composer/next-unstable/business-network/cloud-wallets

Try the REDIS one - quicker and easier to setup at https://github.com/ampretia/composer-wallet-redis

..or stay on the happy path and keep reading...

END ASIDE
----


Start up fabric

```
./fabric_tools/startFabric.sh
```

Install and Start the composer runtime

```
$ npx composer runtime install --card PeerAdmin@hlfv1 -n my-basic-sample
$ npx composer network start --card PeerAdmin@hlfv1 -a  my-basic-sample.bna -A admin -S adminpw  --file admin.card

```


Need to add the card to the wallet, and then it'll be possible to start to use it.

```
$ npx composer card import --file admin.card --name admin@pn-local
$ npx composer network list --card admin@pn-local
```

Update the network

Let's use playground to update the network.  Start the playground with the

```
$ npx composer-playground 1> /dev/null 2>&1 &
```

In the playground, create some participants along these lines...
```
{
"$class": "org.acme.sample.SampleParticipant",
"participantId": "001",
"firstName": "Alice",
"lastName": "Andrews"
}
```

... and keep going as much as you wish


```
$ npx composer network list --card admin@pn-local                                                                                                                           master  ✱
:heavy_check_mark: List business network from card admin@pn-local
models:
org.hyperledger.composer.system
org.acme.sample
scripts:
lib/sample.js
registries:
org.acme.sample.SampleAsset:
id:           org.acme.sample.SampleAsset
name:         Asset registry for org.acme.sample.SampleAsset
registryType: Asset
org.acme.sample.SampleParticipant:
id:           org.acme.sample.SampleParticipant
name:         Participant registry for org.acme.sample.SampleParticipant
registryType: Participant
assets:
001:
$class:        org.acme.sample.SampleParticipant
participantId: 001
firstName:     Alice
lastName:      Andrews
002:
$class:        org.acme.sample.SampleParticipant
participantId: 002
firstName:     Bob
lastName:      Brown
003:
$class:        org.acme.sample.SampleParticipant
participantId: 003
firstName:     Charlie
lastName:      Cook

Command succeeded
```


Use the Playground's ID manager tab to create Identities for the above people, and opt for the "Send the card to somebody else"
So that cards are saved.

eg..
```
[cards] ls                                                                                                                                                                                master  ✱
alice.card  bob.card  charlie.card
```

Start up the redis server... assuming that you don't already have it

```
$ docker run -p 6379:6379 --name composer-wallet-redis -d redis
$ # This command will clearout all the data - useful if you want to re-run this
$ # To re-run issue docker start composer-wallet-redis
$ docker exec composer-wallet-redis redis-cli -c flushall
```

We will now import the cards into REDIS that we have created
Bring up another command window, and install the redis wallet...

```bash
$ npm install -g @ampretia/composer-wallet-redis
$ export NODE_CONFIG={"composer":{"wallet":{"type": "@ampretia/composer-wallet-redis","desc": "Uses a local redis instance","options": { } } }}
```

If you then issue card import commands in this shell, they will use the configuration in redis, not in the filesystem.
You can validate this by swapping back to the previous window. And running commands there.. the cards will not be present

