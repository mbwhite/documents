

The system model file is currently hard-coded string within the modelmanager.js file - this should be represented as a file that can be coded up and converted into a file that can be used.

- system.cto file 
- Nunjucks is already in the build so could be used to create this file ahead of time


 
```

const SYSTEM_MODEL_FILE = `

asset....

`

module.exports = SYSTEM_MODEL_FILE;

```

Actions that are required - create read update delete


Where are they stored?

Separate file- permissions around this needed.


User hierachy

Admin        - can do everthing but deploy a network - PeerAdmin 
Editor       - can access all the resources but can't modify the system acls
Creator      - can access submit transactions to create resources
Subscriber   - can see the data but not modify it

