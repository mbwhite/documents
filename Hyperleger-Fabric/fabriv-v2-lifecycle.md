## Chaincode Package

The starting point of deploying a brand new chaincode starts with the *chaincode package*.

Irrespective of what language or api you have used to write your contract or chaincode, from the peer's perspective when deploying it can be considered a BLOB (Binary Object). Therefore the *package* is made up of your code (treated as a BLOB) and some metadata.

This metadata is a JSON file with

- *Code Path* : for when the BLOB is unpacked, pointer to where the main code is
- *Type* : to indicate what type of builder is needed
- *Label* : a user specified identifier

All that is bundled up into a `.tar.gz` file. This can be used by your organization or other organizations. This needs to be installed on all the peers that will be expected to endorse transactions for the chaincode. 

When you install this with the Fabric `peer` cli you will directly see the `packageid`.

```bash
peer lifecycle chaincode package cp.tar.gz --lang node --path ./contract --label cp_0
peer lifecycle chaincode install cp.tar.gz
```

The *PackageID* is important as that is a unique identifier of this package; it starts with the user specified label, ends with a hash of the BLOB.  Note it is both label and has that comprises the packageid, not just the hash bit. 

Tip: to get the list of the package ids, try this command
```bash
peer lifecycle chaincode queryinstalled --output json
```

There are several implications of using package ids.

- You can take the same binary, and package it with different labels.
- Each organization doesn't have to use the same package id as other organizations, the label can be different and / or the binary can be different.

## Chaincode Definition

When deploying chaincodes, it important to understand the concept of the 'Chaincode Definition'. This is a logical entity that is created; think of it as the data structure that is used within Fabric to manage the chaincodes. 

The definition is comprised of:

- *Name* : the name the chaincode will be referred to on the CLI and by client applications
- *Version* : A free-form field that the you can use to indentify different versions of the chaincode. Fabric does NOT imply any implicity version checks, eg semver, on this field. 
- *Sequence* : If a chaincode definition is modified, then this field must be incremented by 1
- *Endorsement Policy*: Endorsement policy of the chaincode
- *Collection Configuartion*: Specification of the location of the private data collections
- *initialization*: is the initialization function to be called
- *ESCC/VSCC*: Custom endorsement or validation plugins to be used.

Within each *channel* the set of chaincode definitions are indexed by their *name*. Therefore, within a given channel the name has to be unique. Each time the chaincode definition is updated, then the sequence number has to be updated by 1 as well. In effect you are creating an ordered list of chaincode definitions, with the sequence number monotonically increasing. 

Note as well that you can have the same chaincode package in different channels; though there is a check within an given channel you are only using the same packageid once. 

## Approving a Chaincode Definition

So far there you won't have seen an obvious link between the Chaincode Definition and the Chaincode Package. The "Approval" of a definition is the imporant connection. The 'approval' links a chaincode definition and a package id. This is the command that you would use to do this on the CLI - this is taken from the Fabric test-network.

```bash
peer lifecycle chaincode approveformyorg  --orderer localhost:7050 --ordererTLSHostnameOverride orderer.example.com \
                                                --channelID $CHANNEL_ID  \
                                                --name $CONTRACT_NAME  \
                                                --version 0  \
                                                --package-id $PACKAGE_ID \
                                                --sequence 1  \
                                                --tls  \
                                                --cafile $ORDERER_CA \
                                                --collections-config $COLLECTIONS_JSON \

```

> when confronted with this command I'm always reminded of this [xkcd](https://imgs.xkcd.com/comics/tar.png)

Breaking it down to the bits important here.  For this discussion we can ignore the `--orderer...` `--tls` and the `--cafile`. 

- package-id links to the package we've installed on this peer
- channelId is the channel this chaincode will used in
- name is the important key that will be used in later commands and by applications
- version the free-form field that by convention is your definition of what version of chaincode this is.

We now have the *package-id* linked with the *chaincode definition* and the *name* that is used in applications.
The next step is to commit this definition once everybody has approved it. 

What are the implications of this when you want to make a change? If the chaincode definition is altered, then the new definition (with a sequence number 1 up from previous) must be approved by all orgs, and comitted. However remember that the packageid is *not* part of this definition. Therefore the package can be changed for just a single organization without needing approving for everybody.

[ need to test how this works, is it just a package, install and approve?  no commit? ]






