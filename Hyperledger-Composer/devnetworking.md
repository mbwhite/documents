
I encountered a problem, obvious with hindsight, when using docker-compose.  Several docker containers spun up, all happily talking ot each other on their own network. All happy for me to talk to them from the host Ubuntu system as well.

Slight issue of when configuration was epxorted from one of the docker containers, it was refering to the others by the domain it knew, `example.com` - not so great to use it from the host that knew it via localhost. 

Ah I can use sed to reformat the exported data - doable but not that elegant. A much more elegant solution occured to me. Enter the /etc/hosts file

## So to recap the scenario...

1 - Installed a [Fabric/Composer](https://hyperledger.github.io/composer/index.html) setup directly from https://hyperledger.github.io/composer/installing/using-playground-locally.html

If you want to do this now it's the command `curl -sSL https://hyperledger.github.io/composer/install-hlfv1.sh | bash`

2 - This spins up a set of docker images that make up a simple Hyperledger Fabric - and also starts the Composer playground and brings this up in your browser.

3 - But as a developer you want to access this also from command line applications. You then install the composer-cli
`npm install -g composer-cli`

4 - Exporting a Network Card form playground is great, until you come to then use it for real
```
$ composer card import --file ~/Downloads/admin.com
$ composer network list --card admin@bond-network
>uh-oh..... can't conect 
```
This is because from your host command line, the `example.com` hosts that are used in docker-composer network - don't mean much from your host system. 

##Edit /etc/hosts so that the exmaple.com host names resolve to localhost

- Rather than edit by hand, I came across [hostess](https://github.com/cbednarski/hostess) - a simple command line that edits the /etc/hosts
  - Download this from the github repo
  - `chmod u+x hostesss_linux_amd64` to make it executable
  - `sudo mv hostess_linux_amd64 /usr/local/bin/hostess`  to put it on the path and give a simpler name
- This now makes it very easy to add and remove and list entries from the /etc/hosts file.
- So as this is was to make it easy to use the docker hosted version of the Hyperleder Composer Playground here's the json file that contains the extra entries

```
[
  {
    "domain": "ca.org1.example.com",
    "ip": "127.0.0.1",
    "enabled": true
  },
  {
    "domain": "orderer.example.com",
    "ip": "127.0.0.1",
    "enabled": true
  },
  {
    "domain": "peer0.org1.example.com",
    "ip": "127.0.0.1",
    "enabled": true
  }
]

```
- Copy this to a simple text file named say `fabrichosts.json`
- Run the hostess tool to import these
  - `hostess apply fabrichosts.json`

That's it. 

What this means is that from the docker-hosted version of the Composer playground, Network Cards can be exported that refer to the `example.com` address - but they can be used from the command line with ease!
