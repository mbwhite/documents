# Rust Chaincode in Hyperledger Fabric

This is the full journey from start to finish.
First grab a couple of cups of beverage-of-choice and create a empty directory to host all the code.

## Get ready for the external builders

Fabric knows about the following languages implicitly. Java, Node, Go. However the peer is not really supposed to be the orchestrator of creating docker images. So this is where the external builder comes in. 

To setup the external builder, you need to configure the peer and the easiest way to do that is by using the `fabric-builders` project.

```bash
git clone https://github.com/hyperledgendary/fabric-builders
```

Next step is to build the updated peer docker image - we will need to use this to create a local Fabric network.

```bash
docker build -t hyperledgendary/fabric-builder-peer .
```

We're going to create the actual chaincode in an external docker container from the peer. We need therefore a proxy chaincode to install and approve. There is a script to do this in this project; first we need to create a JSON file that links the proxy chaincode to the actual docker container that has the running chaincode.

```bash
touch connection.json
```

And in you editor-of-choice put in this JSON

```json
{
  "address": "wasmcc.example.com:9999",
  "dial_timeout": "10s",
  "tls_required": false
}
```

Then we can create the tgz file needed 

```bash
./tools/pkgcc.sh -l wasmftw -t external connection.json

ls -l wasmftw.tgz
# Output should be like    
# -rw-rw-r-- 1 matthew matthew 457 Jun 17 11:40 wasmftw.tgz
```

We know have enough pieces to create the local Fabric Network

## Create a fabric network

Keep it simple for development and use a single org network; this is easy to create using Ansible. To help clone this example repo; reason is that the default Ansible tooling uses 1.4, and this is using 2.0 with the name of the docker image for the peer updated to the one we've just made.

```bash
git clone git@github.com:hyperledgendary/full-stack-asset-transfer.git
cd full-stack-asset-transfer/tools/ansible
```

Easiest way to use this and make sure all the prereqs are in place is to use pipenv

```bash
pipenv shell
ansible single_org.yml
```

After a few moments, you'll have the fabric network full setup and the proxy contract ready to go!

## Get your rust contract ready

Yes, first step is clone a repo!

```bash
git clone  git@github.com:hyperledgendary/fabric-contract-api-rust.git
```

This contains the Rust Contract API, and a sample contract.

```bash
cargo build --target wasm32-unknown-unknown
```
This will have built a Wasm binary to `fabric-contract-api-rust/target/wasm32-unknown-unknown/debug/basic_contract_rs.wasm`

## Build the external chaincode container

One final git repo to clone

```bash
git clone git@github.com:hyperledgendary/fabric-chaincode-wasm.git
```

Some of the intructions in this repo, we've already done as it makes sense to do it earlier. But we need to build the final docker image

```bash
docker build -t hyperledgendary/fabric-chaincode-wasm .
```

Copy the `chaincode.env.sample` to `chaincode.env`
