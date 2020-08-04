

... for the snapshot builds see if they NPM can be published to the 


rush change --message 'snapshot bulid bb' --bulk --bump-type noneca

/home/matthew/go-master/src/github.com/hyperledger/fabric-chaincode-node/common/changes/fabric-shim/versioning-groundwork_2019-11-08-15-10.json
{
    "changes": [
      {
        "comment": "snapshot bulid bb",
        "type": "none",
        "packageName": "fabric-shim"
      }
    ],
    "packageName": "fabric-shim",
    "email": "whitemat@uk.ibm.com"
  }


// 1.
public void txFunction(Context ctx, ...) {
  Ledger world = Ledger.getLedger().getCollection(Collection.WORLD);
  world.setContext(ctx)
  world.putState(...)
}

// 2.
public void txFunction(Context ctx, ...) {
  Ledger world = Ledger.getLedger(ctx).getCollection(Collection.WORLD); 
  world.putState(...)
}

// 3.
public void txFunction(Context ctx, ...) {
  Ledger world = Ledger.getLedger().getCollection(Collection.WORLD,ctx); 
  world.putState(...)
}

// 4.
public void txFunction(Context ctx, ...) {
  Ledger world = Ledger.getLedger().getCollection(Collection.WORLD); 
  world.putState(ctx, ...)
}