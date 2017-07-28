
# System Access Control

By modelling assets and participants it is possible to control which participant can create, update, retreive and delete buisnessn assets. All defined types in a business network are implicit sub-types of a set of 'System Types'. As these Systems are in effect modelled in the same many as business types Access Control Rules can also be applied to them.  This permits broad system level control to be enforced. 

This system model can be presented by the following CTO file.

```
namespace org.hyperledger.composer.system

abstract asset Asset {  }

abstract participant Participant {   }

abstract transaction Transaction {
  o String transactionId
  o DateTime timestamp
}

abstract event Event identified by eventId{
  o String eventId
  o DateTime timestamp
}

asset Registry identified by registryID {
  o String registryID
}

asset AssetRegistry extends Registry {
}

asset ParticipantRegistry extends Registry {
}

asset TransactionRegistry extends Registry {
}

asset IdentityRegistry extends Registry {
}

asset Identity identified by userID {
  o String userID
  o DateTime issued
  --> Participant participant
  o Boolean activated
  o Boolean revoked
}

asset Network identified by networkID {
  o String networkID
}

```

# Application

ACL enforcement for both business and system level rules is always enabled; and if no matching ACL rule is found, the default action is to DENY access. Therefore it can be important to grant the approriate level of access. A network that is deployed with a black permissions.acl file will be uncontactable.

A grant all access rule would be

```
rule AllAccess {
  description: "AllAccess - grant everything to everybody"
  participant: "org.hyperledger.composer.system.Participant"
  operation: ALL
  resource: "org.hyperledger.composer.system.**"
  action: ALLOW
}
```
This says that for `org.hyperledger.composer.system.Participant` (which is the super-type of all network defined Participants), for *ALL* operations, on `org.hyperledger.composer.system.**` resources (any all network defined resources will be subtypes of this) - the action is *ALLOW*

## Where these rules are defined?
In the current 0.9.x version these need to be defined in the usual permissions.acl file. Future releases are intending to move this to a separate file

## Playground & editors

As the format of the rules is not different, the ACL editor would be able to write the current ACL rules; the vscode/atom plugins alos can edit them.


## CLI commands that will require access to be granted. 
List of the actions that can be performed that will require system level control to be granted. 

- composer network
    - deploy            Registry CREATE ALLOW    Network CREATE ALLOW
    - download          Registry READ ALLOW      Network READ ALLOW
    - list              Registry READ ALLOW      Network READ ALLOW
    - loglevel          Network UPDATE ALLOW
    - ping              Registry READ ALLOW      Network READ ALLOW
    - undeploy          Registry DELETE ALLOW    Network DELETE ALLOW
    - update            Registry UPDATE/CREATE ALLOW    Network UPDATE ALLOW
- composer archive
    - create            n/a
    - list              n/a
- composer identity
    - import            IdentityRegistry  UPDATE ALLOW    Identity CREATE ALLOW
    - issue             IdentityRegistry  UPDATE ALLOW    Identity CREATE ALLOW
    - revoke            IdentityRegistry  UPDATE ALLOW    Identity DELETE ALLOW
- composer generator    
    - create            n/a
- composer participant
    - add               ParticipantRegistry  UPDATE ALLOW    Participant CREATE ALLOW
- composer transaction
    - submit            ? needed
- Any query CLI?


## APIs that require specific permission

Over and above the ACLs that are require for any specific operation within the buisness model; consider if the following 
global rules should be in place. Domain specific are preferred for granualr control

Allow access for all participants to CRUD assets
Allow access for all participants to CRUD registries

/enumerated list here/


## Examples
......