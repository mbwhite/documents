

## Data Model

Asset, and an AssetOwnership structures.

AssetOwnership is record of Asset's UUID, together with reference to the current owner (based on holding organization - may be a proxy for legal title owner)

Asset:

- uuid
- title
- pricepaid    - something that may well be undisclosed
- description  - detailed description


## Need to bootstrap assets into the system

Regulator/Auditor has the sole power to put an asset into the system, than can then be transferred to the legal owner

## Implict Collections

[Implict Collections](https://hyperledger-fabric.readthedocs.io/en/latest/private-data-arch.html#referencing-implicit-collections-from-chaincode)

Name of the collection is `_implicit_org_<MSPID>` 
