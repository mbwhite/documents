

```
composer participant add -p hlfv1 -i admin -s adminpw -n document-network -d '{"$class" : "org.acme.biznet.core.Admin",  "email"  : "alice@example.com",  "firstname" :"alice",  "lastname"  :"andrews",  "jobtitle"  :"super-admin"}'

composer participant add -p hlfv1 -i admin -s adminpw -n document-network -d '{"$class" : "org.acme.biznet.detail.Editor",  "email"  : "eddy@example.com",  "firstname" :"eddy",  "lastname"  :"edwards",  "jobtitle"  :"Editor-in-chief"}' 

composer participant add -p hlfv1 -i admin -s adminpw -n document-network -d '{"$class" : "org.acme.biznet.detail.Author",  "email"  : "arthur@example.com",  "firstname" :"arthur",  "lastname"  :"andrews",  "jobtitle"  :"Lonely Author"}' 

composer participant add -p hlfv1 -i admin -s adminpw -n document-network -d '{"$class" : "org.acme.biznet.detail.Subscriber",  "email"  : "sally@example.com",  "firstname" :"sally",  "lastname"  :"summer",  "jobtitle"  :"A loyal reader"}'

```

  org.acme.biznet.core.Admin: 
    id:           org.acme.biznet.core.Admin
    name:         Participant registry for org.acme.biznet.core.Admin
    registryType: Participant
    assets: 
      alice@example.com: 
        $class:    org.acme.biznet.core.Admin
        email:     alice@example.com
        firstname: alice
        lastname:  andrews
        jobtitle:  super-admin
  org.acme.biznet.detail.Author: 
    id:           org.acme.biznet.detail.Author
    name:         Participant registry for org.acme.biznet.detail.Author
    registryType: Participant
    assets: 
      arthur@example.com: 
        $class:    org.acme.biznet.detail.Author
        email:     arthur@example.com
        firstname: arthur
        lastname:  andrews
        jobtitle:  Lonely Author
  org.acme.biznet.detail.Editor: 
    id:           org.acme.biznet.detail.Editor
    name:         Participant registry for org.acme.biznet.detail.Editor
    registryType: Participant
    assets: 
      eddy@example.com: 
        $class:    org.acme.biznet.detail.Editor
        email:     eddy@example.com
        firstname: eddy
        lastname:  edwards
        jobtitle:  Editor-in-chief
  org.acme.biznet.detail.Subscriber: 
    id:           org.acme.biznet.detail.Subscriber
    name:         Participant registry for org.acme.biznet.detail.Subscriber
    registryType: Participant
    assets: 
      sally@example.com: 
        $class:    org.acme.biznet.detail.Subscriber
        email:     sally@example.com
        firstname: sally
        lastname:  summer
        jobtitle:  A loyal reader


composer identity issue -p hlfv1 -n document-network -i admin -s adminpw -u alice -a org.acme.biznet.core.Admin#alice@example.com
composer identity issue -p hlfv1 -n document-network -i alice -s FbfYOVSdUUkU -u alice -a org.acme.biznet.core.Admin#alice@example.com
composer identity issue -p hlfv1 -n document-network -i alice -s FbfYOVSdUUkU -u alice -a org.acme.biznet.core.Admin#alice@example.com

composer identity issue -p hlfv1 -n document-network -i alice -s FbfYOVSdUUkU -u arthur -a  org.acme.biznet.detail.Author#arthur@example.com
 

An identity was issued to the participant 'org.acme.biznet.core.Admin#alice@example.com'
The participant can now connect to the business network with the following details:
  userID = alice
  userSecret = FbfYOVSdUUkU
Command completed successfully.


composer identity issue -p hlfv1 -n document-network -i admin -s adminpw -u arthur4 -a  org.acme.biznet.detail.Author#arthur@example.com                                                                                  13:04:42  ☁  master ☂ ✖ ⚡ ✭

An identity was issued to the participant 'org.acme.biznet.detail.Author#arthur@example.com'
The participant can now connect to the business network with the following details:
  userID = arthur4
  userSecret = sssQwjsWVOaG
Command completed successfully




composer participant add -p hlfv1 -i -i alice -s ${ALICESECRET}  -n document-network -d '{"$class" : "org.acme.biznet.detail.Subscriber",  "email"  : "sally@example.com",  "firstname" :"sally",  "lastname"  :"summer",  "jobtitle"  :"A loyal reader"}'

Error: Illegal arguments: "checkPersistence" is truthy but "name" is not a valid string value
