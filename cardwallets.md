

For the purposes of building this up step-by-step, first lets create a blank npm project, and intsall all the Hyperleder Composer elements as *local* dependencies

```bash
$ npm init -y
$ npm install composer-cli@next-unstable composer-playground@next-unstable composer-rest-server@next-unstable  --save-dev
$ npm install composer-client@next-unstable --save
```

And then add in the latest fabric-tools.

```bash
$ mkdir fabric-tools
$ curl -O https://raw.githubusercontent.com/hyperledger/composer-tools/master/packages/fabric-dev-servers/fabric-dev-servers.zip
$ unzip -q fabric-dev-servers.zip -d fabric-tools
$ # you can delete the zip file now if you wish
```
> Note that these have been updated today (2March2018) so please make sure you get the latest copies

Setup up some environment variables to start the 
```bash
$ export HL_FABRIC_VERSION=hlfv11
$ export HL_COMPOSER_CLI=$(npm bin)/composer
```

Fabric can now be started and the peer admin card created. However before doing this, setup a NODE_CONFIG
parameter to use the first new feature - create the card store locally

```bash
$ export NODE_CONFIG='{"composer":{"wallet":{"type":"composer-wallet-filesystem","options":{"storePath":"./composer-store"}}}}'
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

> Aside: I start up a Logspout docker image, and use the HTTP adapter to get information on all docker containers. Can be VERY useful, especially when containers error and terminate on startup. Goto https://github.com/gliderlabs/logspout#inspect-log-streams-using-curl

Start up fabric and create the peer admin card required to administer the Fabric Peers. Note that this command will use the comoser cli installed locally - thanks to the `HL_COMPOSER_CLI` variable

```bash 
$ ./fabric-tools/startFabric.sh
$ ./fabric-tools/createPeerAdminCard.sh 
```

Now install the composer runtime; the business network archive also needs to be installed.  Using `npx` here to run the correct composer-cli

```bash
$ npx composer runtime install --card PeerAdmin@hlfv1 -n basic-sample-network
$ npx composer network start --card PeerAdmin@hlfv1 -a  basic-sample-network.bna -A admin -S adminpw  --file admin.card
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


Need to add the Network Admin Card to the wallet... and list out the cards.

```bash
$ npx composer card import --file admin.card --name admin@pn-local
$ npx composer card list
The following Business Network Cards are available:

Connection Profile: hlfv1
┌─────────────────┬───────────┬──────────────────────┐
│ Card Name       │ UserId    │ Business Network     │
├─────────────────┼───────────┼──────────────────────┤
│ admin@pn-local  │ admin     │ basic-sample-network │
├─────────────────┼───────────┼──────────────────────┤
│ PeerAdmin@hlfv1 │ PeerAdmin │                      │
└─────────────────┴───────────┴──────────────────────┘

$ npx composer network list --card admin@pn-local                                           
✔ List business network from card admin@pn-local
models: 
  - org.hyperledger.composer.system
  - org.acme.sample
scripts: 
  - lib/sample.js
registries: 
  org.acme.sample.SampleAsset: 
    id:           org.acme.sample.SampleAsset
    name:         Asset registry for org.acme.sample.SampleAsset
    registryType: Asset
  org.acme.sample.SampleParticipant: 
    id:           org.acme.sample.SampleParticipant
    name:         Participant registry for org.acme.sample.SampleParticipant
    registryType: Participant

Command succeeded

```

As an experiement if you move to say the parent directory, and issue the list command (can't use npx here as it's a different directory) the output will say there are no cards. This is because the setup is using relative paths (see above `./composer-store`)
```bash
$ $HL_COMPOSER_CLI card list                                                                          
There are no Business Network Cards available.

Command succeeded
$ cd cloud-wallets
$ $HL_COMPOSER_CLI card list                                                              
The following Business Network Cards are available:

Connection Profile: hlfv1
┌─────────────────┬───────────┬──────────────────────┐
│ Card Name       │ UserId    │ Business Network     │
├─────────────────┼───────────┼──────────────────────┤
│ admin@pn-local  │ admin     │ basic-sample-network │
├─────────────────┼───────────┼──────────────────────┤
│ PeerAdmin@hlfv1 │ PeerAdmin │                      │
└─────────────────┴───────────┴──────────────────────┘
```

Let's use playground to update the network, the plan is to add other participants that we can then issue with Network Cards.  Start the playground with

```
$ npx composer-playground 1> /dev/null 2>&1 &
```

In the playground, create some participants along these lines...... and keep going as much as you wish.  Going to create three here for Alice Bob and Charlie
```
{
"$class": "org.acme.sample.SampleParticipant",
"participantId": "001",
"firstName": "Alice",
"lastName": "Andrews"
}
{
"$class": "org.acme.sample.SampleParticipant",
"participantId": "002",
"firstName": "Bob",
"lastName": "Brown"
}
{
"$class": "org.acme.sample.SampleParticipant",
"participantId": "003",
"firstName": "Charlie",
"lastName": "Cook"
}
```
Use the Playground's ID manager tab to create Identities for the above people, and opt for the "Send the card to somebody else"
I've saved all of these as alice.card, bob.card and charlie.card

We've been storing the cards in a local directory up to now, but as Alice, Bob and Charlie are QA testers we're going to 
start up a redis server to keep the cards. They can then access this and use.  (yes this is all local but doesn't have to be)

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
$ # that will change at some point to drop the prefix
$ export NODE_CONFIG='{"composer":{"wallet":{"type": "@ampretia/composer-wallet-redis","desc": "Local redis","options":{}}}}'
```

If you then issue card import commands in this shell, they will use the configuration in redis, not in the filesystem.
You can validate this by swapping back to the previous window. And running commands there.. the cards will not be present. Card import is the same as normal, and so are `composer network list` commands

You can use the redis cli to look inside and see the cards being stored
```bash
docker run -it --link composer-wallet-redis:redis --rm redis redis-cli -h redis -p 6379
redis:6379> keys *
1) "client-data/alice@basic-sample-network/alice"
2) "cards/bob@basic-sample-network"
3) "cards/charlie@basic-sample-network"
4) "client-data/alice@basic-sample-network/f1b0ec2009fe41f8a238518467f96228de895d02d137d15ef4a24461865688be-priv"
5) "cards/alice@basic-sample-network"
6) "client-data/alice@basic-sample-network/f1b0ec2009fe41f8a238518467f96228de895d02d137d15ef4a24461865688be-pub"
redis:6379> 
```

This is the output after importing the cards and using Alice's card. (`npx composer network list --card alice@basic-sample-network`)

