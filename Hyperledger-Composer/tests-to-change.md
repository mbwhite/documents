  
      let classDecl = intro.getClassDeclarations().filter( (element) => {
           return !element.isSystemType();
      });


  4) JSONSchemaVisitor #visit should generate JSON Schema v4 files for each type in the Concerto model:
     expected openFile to be called 8 times but was called 14 times
    openFile(org.hyperledger.composer.system.Registry.json) at JSONSchemaVisitor.visitClassDeclarationCommon (/home/matthew/github/composer/packages/composer-common/lib/codegen/fromcto/jsonschema/jsonschemavisitor.js:283:39)
    openFile(org.hyperledger.composer.system.AssetRegistry.json) at JSONSchemaVisitor.visitClassDeclarationCommon (/home/matthew/github/composer/packages/composer-common/lib/codegen/fromcto/jsonschema/jsonschemavisitor.js:283:39)
    openFile(org.hyperledger.composer.system.ParticipantRegistry.json) at JSONSchemaVisitor.visitClassDeclarationCommon (/home/matthew/github/composer/packages/composer-common/lib/codegen/fromcto/jsonschema/jsonschemavisitor.js:283:39)
    openFile(org.hyperledger.composer.system.TransactionRegistry.json) at JSONSchemaVisitor.visitClassDeclarationCommon (/home/matthew/github/composer/packages/composer-common/lib/codegen/fromcto/jsonschema/jsonschemavisitor.js:283:39)
    openFile(org.hyperledger.composer.system.IdentityRegistry.json) at JSONSchemaVisitor.visitClassDeclarationCommon (/home/matthew/github/composer/packages/composer-common/lib/codegen/fromcto/jsonschema/jsonschemavisitor.js:283:39)
    openFile(org.hyperledger.composer.system.Identity.json) at JSONSchemaVisitor.visitClassDeclarationCommon (/home/matthew/github/composer/packages/composer-common/lib/codegen/fromcto/jsonschema/jsonschemavisitor.js:283:39)
    openFile(org.acme.base.SimpleAsset.json) at JSONSchemaVisitor.visitClassDeclarationCommon (/home/matthew/github/composer/packages/composer-common/lib/codegen/fromcto/jsonschema/jsonschemavisitor.js:283:39)
    openFile(org.acme.base.BaseAsset.json) at JSONSchemaVisitor.visitClassDeclarationCommon (/home/matthew/github/composer/packages/composer-common/lib/codegen/fromcto/jsonschema/jsonschemavisitor.js:283:39)
    openFile(org.acme.base.DerivedAsset.json) at JSONSchemaVisitor.visitClassDeclarationCommon (/home/matthew/github/composer/packages/composer-common/lib/codegen/fromcto/jsonschema/jsonschemavisitor.js:283:39)
    openFile(org.acme.base.DerivedDerivedAsset.json) at JSONSchemaVisitor.visitClassDeclarationCommon (/home/matthew/github/composer/packages/composer-common/lib/codegen/fromcto/jsonschema/jsonschemavisitor.js:283:39)
    openFile(org.acme.base.MyBasicTransaction.json) at JSONSchemaVisitor.visitClassDeclarationCommon (/home/matthew/github/composer/packages/composer-common/lib/codegen/fromcto/jsonschema/jsonschemavisitor.js:283:39)
    openFile(org.acme.base.MyTransaction.json) at JSONSchemaVisitor.visitClassDeclarationCommon (/home/matthew/github/composer/packages/composer-common/lib/codegen/fromcto/jsonschema/jsonschemavisitor.js:283:39)
    openFile(org.acme.base.MyTransactionEx.json) at JSONSchemaVisitor.visitClassDeclarationCommon (/home/matthew/github/composer/packages/composer-common/lib/codegen/fromcto/jsonschema/jsonschemavisitor.js:283:39)
    openFile(org.acme.base.UnitedStatesAddress.json) at JSONSchemaVisitor.visitClassDeclarationCommon (/home/matthew/github/composer/packages/composer-common/lib/codegen/fromcto/jsonschema/jsonschemavisitor.js:283:39)
  AssertError: expected openFile to be called 8 times but was called 14 times
      openFile(org.hyperledger.composer.system.Registry.json) at JSONSchemaVisitor.visitClassDeclarationCommon (lib/codegen/fromcto/jsonschema/jsonschemavisitor.js:283:39)
      openFile(org.hyperledger.composer.system.AssetRegistry.json) at JSONSchemaVisitor.visitClassDeclarationCommon (lib/codegen/fromcto/jsonschema/jsonschemavisitor.js:283:39)
      openFile(org.hyperledger.composer.system.ParticipantRegistry.json) at JSONSchemaVisitor.visitClassDeclarationCommon (lib/codegen/fromcto/jsonschema/jsonschemavisitor.js:283:39)
      openFile(org.hyperledger.composer.system.TransactionRegistry.json) at JSONSchemaVisitor.visitClassDeclarationCommon (lib/codegen/fromcto/jsonschema/jsonschemavisitor.js:283:39)
      openFile(org.hyperledger.composer.system.IdentityRegistry.json) at JSONSchemaVisitor.visitClassDeclarationCommon (lib/codegen/fromcto/jsonschema/jsonschemavisitor.js:283:39)
      openFile(org.hyperledger.composer.system.Identity.json) at JSONSchemaVisitor.visitClassDeclarationCommon (lib/codegen/fromcto/jsonschema/jsonschemavisitor.js:283:39)
      openFile(org.acme.base.SimpleAsset.json) at JSONSchemaVisitor.visitClassDeclarationCommon (lib/codegen/fromcto/jsonschema/jsonschemavisitor.js:283:39)
      openFile(org.acme.base.BaseAsset.json) at JSONSchemaVisitor.visitClassDeclarationCommon (lib/codegen/fromcto/jsonschema/jsonschemavisitor.js:283:39)
      openFile(org.acme.base.DerivedAsset.json) at JSONSchemaVisitor.visitClassDeclarationCommon (lib/codegen/fromcto/jsonschema/jsonschemavisitor.js:283:39)
      openFile(org.acme.base.DerivedDerivedAsset.json) at JSONSchemaVisitor.visitClassDeclarationCommon (lib/codegen/fromcto/jsonschema/jsonschemavisitor.js:283:39)
      openFile(org.acme.base.MyBasicTransaction.json) at JSONSchemaVisitor.visitClassDeclarationCommon (lib/codegen/fromcto/jsonschema/jsonschemavisitor.js:283:39)
      openFile(org.acme.base.MyTransaction.json) at JSONSchemaVisitor.visitClassDeclarationCommon (lib/codegen/fromcto/jsonschema/jsonschemavisitor.js:283:39)
      openFile(org.acme.base.MyTransactionEx.json) at JSONSchemaVisitor.visitClassDeclarationCommon (lib/codegen/fromcto/jsonschema/jsonschemavisitor.js:283:39)
      openFile(org.acme.base.UnitedStatesAddress.json) at JSONSchemaVisitor.visitClassDeclarationCommon (lib/codegen/fromcto/jsonschema/jsonschemavisitor.js:283:39)
      at Object.fail (/home/matthew/github/composer/node_modules/sinon/lib/sinon/assert.js:110:29)
      at failAssertion (/home/matthew/github/composer/node_modules/sinon/lib/sinon/assert.js:69:24)
      at Object.assertCallCount [as callCount] (/home/matthew/github/composer/node_modules/sinon/lib/sinon/assert.js:151:21)
      at Context.it (test/codegen/jsonschemavisitor.js:81:26)

  5) LoopbackVisitor namespaces = undefined #visit should generate Loopback model files for each type when given a model manager:
     AssertionError: expected [ Array(16) ] to have a length of 10 but got 16
      at Context.it (test/codegen/loopbackvisitor.js:101:41)

  6) LoopbackVisitor namespaces = undefined #visit should use the model file of the referencing type to resolve enumeration types:

      AssertionError: expected [ Array(8) ] to deeply equal [ Array(2) ]
      + expected - actual

       [
         {
           "acls": []
           "base": "PersistedModel"
      -    "description": "An asset named Registry"
      -    "idInjection": false
      -    "methods": []
      -    "name": "Registry"
      -    "options": {
      -      "composer": {
      -        "fqn": "org.hyperledger.composer.system.Registry"
      -        "name": "Registry"
      -        "namespace": "org.hyperledger.composer.system"
      -        "type": "asset"
      -      }
      -      "validateUpsert": true
      -    }
      -    "plural": "Registry"
      -    "properties": {
      -      "$class": {
      -        "default": "org.hyperledger.composer.system.Registry"
      -        "description": "The class identifier for this type"
      -        "required": false
      -        "type": "string"
      -      }
      -      "registryID": {
      -        "description": "The instance identifier for this type"
      -        "id": true
      -        "required": true
      -        "type": "string"
      -      }
      -    }
      -    "relations": {}
      -    "validations": []
      -  }
      -  {
      -    "acls": []
      -    "base": "PersistedModel"
      -    "description": "An asset named AssetRegistry"
      -    "idInjection": false
      -    "methods": []
      -    "name": "AssetRegistry"
      -    "options": {
      -      "composer": {
      -        "fqn": "org.hyperledger.composer.system.AssetRegistry"
      -        "name": "AssetRegistry"
      -        "namespace": "org.hyperledger.composer.system"
      -        "type": "asset"
      -      }
      -      "validateUpsert": true
      -    }
      -    "plural": "AssetRegistry"
      -    "properties": {
      -      "$class": {
      -        "default": "org.hyperledger.composer.system.AssetRegistry"
      -        "description": "The class identifier for this type"
      -        "required": false
      -        "type": "string"
      -      }
      -      "registryID": {
      -        "description": "The instance identifier for this type"
      -        "id": true
      -        "required": true
      -        "type": "string"
      -      }
      -    }
      -    "relations": {}
      -    "validations": []
      -  }
      -  {
      -    "acls": []
      -    "base": "PersistedModel"
      -    "description": "An asset named ParticipantRegistry"
      -    "idInjection": false
      -    "methods": []
      -    "name": "ParticipantRegistry"
      -    "options": {
      -      "composer": {
      -        "fqn": "org.hyperledger.composer.system.ParticipantRegistry"
      -        "name": "ParticipantRegistry"
      -        "namespace": "org.hyperledger.composer.system"
      -        "type": "asset"
      -      }
      -      "validateUpsert": true
      -    }
      -    "plural": "ParticipantRegistry"
      -    "properties": {
      -      "$class": {
      -        "default": "org.hyperledger.composer.system.ParticipantRegistry"
      -        "description": "The class identifier for this type"
      -        "required": false
      -        "type": "string"
      -      }
      -      "registryID": {
      -        "description": "The instance identifier for this type"
      -        "id": true
      -        "required": true
      -        "type": "string"
      -      }
      -    }
      -    "relations": {}
      -    "validations": []
      -  }
      -  {
      -    "acls": []
      -    "base": "PersistedModel"
      -    "description": "An asset named TransactionRegistry"
      -    "idInjection": false
      -    "methods": []
      -    "name": "TransactionRegistry"
      -    "options": {
      -      "composer": {
      -        "fqn": "org.hyperledger.composer.system.TransactionRegistry"
      -        "name": "TransactionRegistry"
      -        "namespace": "org.hyperledger.composer.system"
      -        "type": "asset"
      -      }
      -      "validateUpsert": true
      -    }
      -    "plural": "TransactionRegistry"
      -    "properties": {
      -      "$class": {
      -        "default": "org.hyperledger.composer.system.TransactionRegistry"
      -        "description": "The class identifier for this type"
      -        "required": false
      -        "type": "string"
      -      }
      -      "registryID": {
      -        "description": "The instance identifier for this type"
      -        "id": true
      -        "required": true
      -        "type": "string"
      -      }
      -    }
      -    "relations": {}
      -    "validations": []
      -  }
      -  {
      -    "acls": []
      -    "base": "PersistedModel"
      -    "description": "An asset named IdentityRegistry"
      -    "idInjection": false
      -    "methods": []
      -    "name": "IdentityRegistry"
      -    "options": {
      -      "composer": {
      -        "fqn": "org.hyperledger.composer.system.IdentityRegistry"
      -        "name": "IdentityRegistry"
      -        "namespace": "org.hyperledger.composer.system"
      -        "type": "asset"
      -      }
      -      "validateUpsert": true
      -    }
      -    "plural": "IdentityRegistry"
      -    "properties": {
      -      "$class": {
      -        "default": "org.hyperledger.composer.system.IdentityRegistry"
      -        "description": "The class identifier for this type"
      -        "required": false
      -        "type": "string"
      -      }
      -      "registryID": {
      -        "description": "The instance identifier for this type"
      -        "id": true
      -        "required": true
      -        "type": "string"
      -      }
      -    }
      -    "relations": {}
      -    "validations": []
      -  }
      -  {
      -    "acls": []
      -    "base": "PersistedModel"
      -    "description": "An asset named Identity"
      -    "idInjection": false
      -    "methods": []
      -    "name": "Identity"
      -    "options": {
      -      "composer": {
      -        "fqn": "org.hyperledger.composer.system.Identity"
      -        "name": "Identity"
      -        "namespace": "org.hyperledger.composer.system"
      -        "type": "asset"
      -      }
      -      "validateUpsert": true
      -    }
      -    "plural": "Identity"
      -    "properties": {
      -      "$class": {
      -        "default": "org.hyperledger.composer.system.Identity"
      -        "description": "The class identifier for this type"
      -        "required": false
      -        "type": "string"
      -      }
      -      "activated": {
      -        "required": true
      -        "type": "boolean"
      -      }
      -      "issued": {
      -        "required": true
      -        "type": "date"
      -      }
      -      "participant": {
      -        "description": "The identifier of an instance of participant"
      -        "required": true
      -        "type": "String"
      -      }
      -      "revoked": {
      -        "required": true
      -        "type": "boolean"
      -      }
      -      "userID": {
      -        "description": "The instance identifier for this type"
      -        "id": true
      -        "required": true
      -        "type": "string"
      -      }
      -    }
      -    "relations": {}
      -    "validations": []
      -  }
      -  {
      -    "acls": []
      -    "base": "PersistedModel"
           "description": "An asset named MyAsset"
           "idInjection": false
           "methods": []
           "name": "MyAsset"
      
      at assertEqual (/home/matthew/github/composer/node_modules/chai/lib/chai/core/assertions.js:485:19)
      at ctx.(anonymous function) (/home/matthew/github/composer/node_modules/chai/lib/chai/utils/addMethod.js:41:25)
      at somethingMethod (/home/matthew/github/composer/node_modules/chai-things/lib/chai-things.js:97:25)
      at ctx.(anonymous function) (/home/matthew/github/composer/node_modules/chai/lib/chai/utils/overwriteMethod.js:49:33)
      at allMethod (/home/matthew/github/composer/node_modules/chai-things/lib/chai-things.js:165:25)
      at ctx.(anonymous function) (/home/matthew/github/composer/node_modules/chai/lib/chai/utils/overwriteMethod.js:49:33)
      at doAsserterAsyncAndAddThen (/home/matthew/github/composer/node_modules/chai-as-promised/lib/chai-as-promised.js:293:29)
      at .<anonymous> (/home/matthew/github/composer/node_modules/chai-as-promised/lib/chai-as-promised.js:252:17)
      at ctx.(anonymous function) [as equal] (/home/matthew/github/composer/node_modules/chai/lib/chai/utils/overwriteMethod.js:49:33)
      at Context.it (test/codegen/loopbackvisitor.js:914:41)

  7) LoopbackVisitor namespaces = undefined #visit should use the model file of the referencing type to resolve other types:

      AssertionError: expected [ Array(9) ] to deeply equal [ Array(3) ]
      + expected - actual

       [
         {
           "acls": []
           "base": "PersistedModel"
      -    "description": "An asset named Registry"
      -    "idInjection": false
      -    "methods": []
      -    "name": "Registry"
      -    "options": {
      -      "composer": {
      -        "fqn": "org.hyperledger.composer.system.Registry"
      -        "name": "Registry"
      -        "namespace": "org.hyperledger.composer.system"
      -        "type": "asset"
      -      }
      -      "validateUpsert": true
      -    }
      -    "plural": "Registry"
      -    "properties": {
      -      "$class": {
      -        "default": "org.hyperledger.composer.system.Registry"
      -        "description": "The class identifier for this type"
      -        "required": false
      -        "type": "string"
      -      }
      -      "registryID": {
      -        "description": "The instance identifier for this type"
      -        "id": true
      -        "required": true
      -        "type": "string"
      -      }
      -    }
      -    "relations": {}
      -    "validations": []
      -  }
      -  {
      -    "acls": []
      -    "base": "PersistedModel"
      -    "description": "An asset named AssetRegistry"
      -    "idInjection": false
      -    "methods": []
      -    "name": "AssetRegistry"
      -    "options": {
      -      "composer": {
      -        "fqn": "org.hyperledger.composer.system.AssetRegistry"
      -        "name": "AssetRegistry"
      -        "namespace": "org.hyperledger.composer.system"
      -        "type": "asset"
      -      }
      -      "validateUpsert": true
      -    }
      -    "plural": "AssetRegistry"
      -    "properties": {
      -      "$class": {
      -        "default": "org.hyperledger.composer.system.AssetRegistry"
      -        "description": "The class identifier for this type"
      -        "required": false
      -        "type": "string"
      -      }
      -      "registryID": {
      -        "description": "The instance identifier for this type"
      -        "id": true
      -        "required": true
      -        "type": "string"
      -      }
      -    }
      -    "relations": {}
      -    "validations": []
      -  }
      -  {
      -    "acls": []
      -    "base": "PersistedModel"
      -    "description": "An asset named ParticipantRegistry"
      -    "idInjection": false
      -    "methods": []
      -    "name": "ParticipantRegistry"
      -    "options": {
      -      "composer": {
      -        "fqn": "org.hyperledger.composer.system.ParticipantRegistry"
      -        "name": "ParticipantRegistry"
      -        "namespace": "org.hyperledger.composer.system"
      -        "type": "asset"
      -      }
      -      "validateUpsert": true
      -    }
      -    "plural": "ParticipantRegistry"
      -    "properties": {
      -      "$class": {
      -        "default": "org.hyperledger.composer.system.ParticipantRegistry"
      -        "description": "The class identifier for this type"
      -        "required": false
      -        "type": "string"
      -      }
      -      "registryID": {
      -        "description": "The instance identifier for this type"
      -        "id": true
      -        "required": true
      -        "type": "string"
      -      }
      -    }
      -    "relations": {}
      -    "validations": []
      -  }
      -  {
      -    "acls": []
      -    "base": "PersistedModel"
      -    "description": "An asset named TransactionRegistry"
      -    "idInjection": false
      -    "methods": []
      -    "name": "TransactionRegistry"
      -    "options": {
      -      "composer": {
      -        "fqn": "org.hyperledger.composer.system.TransactionRegistry"
      -        "name": "TransactionRegistry"
      -        "namespace": "org.hyperledger.composer.system"
      -        "type": "asset"
      -      }
      -      "validateUpsert": true
      -    }
      -    "plural": "TransactionRegistry"
      -    "properties": {
      -      "$class": {
      -        "default": "org.hyperledger.composer.system.TransactionRegistry"
      -        "description": "The class identifier for this type"
      -        "required": false
      -        "type": "string"
      -      }
      -      "registryID": {
      -        "description": "The instance identifier for this type"
      -        "id": true
      -        "required": true
      -        "type": "string"
      -      }
      -    }
      -    "relations": {}
      -    "validations": []
      -  }
      -  {
      -    "acls": []
      -    "base": "PersistedModel"
      -    "description": "An asset named IdentityRegistry"
      -    "idInjection": false
      -    "methods": []
      -    "name": "IdentityRegistry"
      -    "options": {
      -      "composer": {
      -        "fqn": "org.hyperledger.composer.system.IdentityRegistry"
      -        "name": "IdentityRegistry"
      -        "namespace": "org.hyperledger.composer.system"
      -        "type": "asset"
      -      }
      -      "validateUpsert": true
      -    }
      -    "plural": "IdentityRegistry"
      -    "properties": {
      -      "$class": {
      -        "default": "org.hyperledger.composer.system.IdentityRegistry"
      -        "description": "The class identifier for this type"
      -        "required": false
      -        "type": "string"
      -      }
      -      "registryID": {
      -        "description": "The instance identifier for this type"
      -        "id": true
      -        "required": true
      -        "type": "string"
      -      }
      -    }
      -    "relations": {}
      -    "validations": []
      -  }
      -  {
      -    "acls": []
      -    "base": "PersistedModel"
      -    "description": "An asset named Identity"
      -    "idInjection": false
      -    "methods": []
      -    "name": "Identity"
      -    "options": {
      -      "composer": {
      -        "fqn": "org.hyperledger.composer.system.Identity"
      -        "name": "Identity"
      -        "namespace": "org.hyperledger.composer.system"
      -        "type": "asset"
      -      }
      -      "validateUpsert": true
      -    }
      -    "plural": "Identity"
      -    "properties": {
      -      "$class": {
      -        "default": "org.hyperledger.composer.system.Identity"
      -        "description": "The class identifier for this type"
      -        "required": false
      -        "type": "string"
      -      }
      -      "activated": {
      -        "required": true
      -        "type": "boolean"
      -      }
      -      "issued": {
      -        "required": true
      -        "type": "date"
      -      }
      -      "participant": {
      -        "description": "The identifier of an instance of participant"
      -        "required": true
      -        "type": "String"
      -      }
      -      "revoked": {
      -        "required": true
      -        "type": "boolean"
      -      }
      -      "userID": {
      -        "description": "The instance identifier for this type"
      -        "id": true
      -        "required": true
      -        "type": "string"
      -      }
      -    }
      -    "relations": {}
      -    "validations": []
      -  }
      -  {
      -    "acls": []
      -    "base": "PersistedModel"
           "description": "An asset named MyInlineAsset"
           "idInjection": false
           "methods": []
           "name": "MyInlineAsset"
      
      at assertEqual (/home/matthew/github/composer/node_modules/chai/lib/chai/core/assertions.js:485:19)
      at ctx.(anonymous function) (/home/matthew/github/composer/node_modules/chai/lib/chai/utils/addMethod.js:41:25)
      at somethingMethod (/home/matthew/github/composer/node_modules/chai-things/lib/chai-things.js:97:25)
      at ctx.(anonymous function) (/home/matthew/github/composer/node_modules/chai/lib/chai/utils/overwriteMethod.js:49:33)
      at allMethod (/home/matthew/github/composer/node_modules/chai-things/lib/chai-things.js:165:25)
      at ctx.(anonymous function) (/home/matthew/github/composer/node_modules/chai/lib/chai/utils/overwriteMethod.js:49:33)
      at doAsserterAsyncAndAddThen (/home/matthew/github/composer/node_modules/chai-as-promised/lib/chai-as-promised.js:293:29)
      at .<anonymous> (/home/matthew/github/composer/node_modules/chai-as-promised/lib/chai-as-promised.js:252:17)
      at ctx.(anonymous function) [as equal] (/home/matthew/github/composer/node_modules/chai/lib/chai/utils/overwriteMethod.js:49:33)
      at Context.it (test/codegen/loopbackvisitor.js:1016:41)

  8) LoopbackVisitor namespaces = true #visit should generate Loopback model files for each type when given a model manager:
     AssertionError: expected [ Array(16) ] to have a length of 10 but got 16
      at Context.it (test/codegen/loopbackvisitor.js:101:41)

  9) LoopbackVisitor namespaces = true #visit should use the model file of the referencing type to resolve enumeration types:

      AssertionError: expected [ Array(8) ] to deeply equal [ Array(2) ]
      + expected - actual

       [
         {
           "acls": []
           "base": "PersistedModel"
      -    "description": "An asset named Registry"
      -    "idInjection": false
      -    "methods": []
      -    "name": "org_hyperledger_composer_system_Registry"
      -    "options": {
      -      "composer": {
      -        "fqn": "org.hyperledger.composer.system.Registry"
      -        "name": "Registry"
      -        "namespace": "org.hyperledger.composer.system"
      -        "type": "asset"
      -      }
      -      "validateUpsert": true
      -    }
      -    "plural": "org.hyperledger.composer.system.Registry"
      -    "properties": {
      -      "$class": {
      -        "default": "org.hyperledger.composer.system.Registry"
      -        "description": "The class identifier for this type"
      -        "required": false
      -        "type": "string"
      -      }
      -      "registryID": {
      -        "description": "The instance identifier for this type"
      -        "id": true
      -        "required": true
      -        "type": "string"
      -      }
      -    }
      -    "relations": {}
      -    "validations": []
      -  }
      -  {
      -    "acls": []
      -    "base": "PersistedModel"
      -    "description": "An asset named AssetRegistry"
      -    "idInjection": false
      -    "methods": []
      -    "name": "org_hyperledger_composer_system_AssetRegistry"
      -    "options": {
      -      "composer": {
      -        "fqn": "org.hyperledger.composer.system.AssetRegistry"
      -        "name": "AssetRegistry"
      -        "namespace": "org.hyperledger.composer.system"
      -        "type": "asset"
      -      }
      -      "validateUpsert": true
      -    }
      -    "plural": "org.hyperledger.composer.system.AssetRegistry"
      -    "properties": {
      -      "$class": {
      -        "default": "org.hyperledger.composer.system.AssetRegistry"
      -        "description": "The class identifier for this type"
      -        "required": false
      -        "type": "string"
      -      }
      -      "registryID": {
      -        "description": "The instance identifier for this type"
      -        "id": true
      -        "required": true
      -        "type": "string"
      -      }
      -    }
      -    "relations": {}
      -    "validations": []
      -  }
      -  {
      -    "acls": []
      -    "base": "PersistedModel"
      -    "description": "An asset named ParticipantRegistry"
      -    "idInjection": false
      -    "methods": []
      -    "name": "org_hyperledger_composer_system_ParticipantRegistry"
      -    "options": {
      -      "composer": {
      -        "fqn": "org.hyperledger.composer.system.ParticipantRegistry"
      -        "name": "ParticipantRegistry"
      -        "namespace": "org.hyperledger.composer.system"
      -        "type": "asset"
      -      }
      -      "validateUpsert": true
      -    }
      -    "plural": "org.hyperledger.composer.system.ParticipantRegistry"
      -    "properties": {
      -      "$class": {
      -        "default": "org.hyperledger.composer.system.ParticipantRegistry"
      -        "description": "The class identifier for this type"
      -        "required": false
      -        "type": "string"
      -      }
      -      "registryID": {
      -        "description": "The instance identifier for this type"
      -        "id": true
      -        "required": true
      -        "type": "string"
      -      }
      -    }
      -    "relations": {}
      -    "validations": []
      -  }
      -  {
      -    "acls": []
      -    "base": "PersistedModel"
      -    "description": "An asset named TransactionRegistry"
      -    "idInjection": false
      -    "methods": []
      -    "name": "org_hyperledger_composer_system_TransactionRegistry"
      -    "options": {
      -      "composer": {
      -        "fqn": "org.hyperledger.composer.system.TransactionRegistry"
      -        "name": "TransactionRegistry"
      -        "namespace": "org.hyperledger.composer.system"
      -        "type": "asset"
      -      }
      -      "validateUpsert": true
      -    }
      -    "plural": "org.hyperledger.composer.system.TransactionRegistry"
      -    "properties": {
      -      "$class": {
      -        "default": "org.hyperledger.composer.system.TransactionRegistry"
      -        "description": "The class identifier for this type"
      -        "required": false
      -        "type": "string"
      -      }
      -      "registryID": {
      -        "description": "The instance identifier for this type"
      -        "id": true
      -        "required": true
      -        "type": "string"
      -      }
      -    }
      -    "relations": {}
      -    "validations": []
      -  }
      -  {
      -    "acls": []
      -    "base": "PersistedModel"
      -    "description": "An asset named IdentityRegistry"
      -    "idInjection": false
      -    "methods": []
      -    "name": "org_hyperledger_composer_system_IdentityRegistry"
      -    "options": {
      -      "composer": {
      -        "fqn": "org.hyperledger.composer.system.IdentityRegistry"
      -        "name": "IdentityRegistry"
      -        "namespace": "org.hyperledger.composer.system"
      -        "type": "asset"
      -      }
      -      "validateUpsert": true
      -    }
      -    "plural": "org.hyperledger.composer.system.IdentityRegistry"
      -    "properties": {
      -      "$class": {
      -        "default": "org.hyperledger.composer.system.IdentityRegistry"
      -        "description": "The class identifier for this type"
      -        "required": false
      -        "type": "string"
      -      }
      -      "registryID": {
      -        "description": "The instance identifier for this type"
      -        "id": true
      -        "required": true
      -        "type": "string"
      -      }
      -    }
      -    "relations": {}
      -    "validations": []
      -  }
      -  {
      -    "acls": []
      -    "base": "PersistedModel"
      -    "description": "An asset named Identity"
      -    "idInjection": false
      -    "methods": []
      -    "name": "org_hyperledger_composer_system_Identity"
      -    "options": {
      -      "composer": {
      -        "fqn": "org.hyperledger.composer.system.Identity"
      -        "name": "Identity"
      -        "namespace": "org.hyperledger.composer.system"
      -        "type": "asset"
      -      }
      -      "validateUpsert": true
      -    }
      -    "plural": "org.hyperledger.composer.system.Identity"
      -    "properties": {
      -      "$class": {
      -        "default": "org.hyperledger.composer.system.Identity"
      -        "description": "The class identifier for this type"
      -        "required": false
      -        "type": "string"
      -      }
      -      "activated": {
      -        "required": true
      -        "type": "boolean"
      -      }
      -      "issued": {
      -        "required": true
      -        "type": "date"
      -      }
      -      "participant": {
      -        "description": "The identifier of an instance of participant"
      -        "required": true
      -        "type": "String"
      -      }
      -      "revoked": {
      -        "required": true
      -        "type": "boolean"
      -      }
      -      "userID": {
      -        "description": "The instance identifier for this type"
      -        "id": true
      -        "required": true
      -        "type": "string"
      -      }
      -    }
      -    "relations": {}
      -    "validations": []
      -  }
      -  {
      -    "acls": []
      -    "base": "PersistedModel"
           "description": "An asset named MyAsset"
           "idInjection": false
           "methods": []
           "name": "org_acme_base_MyAsset"
      
      at assertEqual (/home/matthew/github/composer/node_modules/chai/lib/chai/core/assertions.js:485:19)
      at ctx.(anonymous function) (/home/matthew/github/composer/node_modules/chai/lib/chai/utils/addMethod.js:41:25)
      at somethingMethod (/home/matthew/github/composer/node_modules/chai-things/lib/chai-things.js:97:25)
      at ctx.(anonymous function) (/home/matthew/github/composer/node_modules/chai/lib/chai/utils/overwriteMethod.js:49:33)
      at allMethod (/home/matthew/github/composer/node_modules/chai-things/lib/chai-things.js:165:25)
      at ctx.(anonymous function) (/home/matthew/github/composer/node_modules/chai/lib/chai/utils/overwriteMethod.js:49:33)
      at doAsserterAsyncAndAddThen (/home/matthew/github/composer/node_modules/chai-as-promised/lib/chai-as-promised.js:293:29)
      at .<anonymous> (/home/matthew/github/composer/node_modules/chai-as-promised/lib/chai-as-promised.js:252:17)
      at ctx.(anonymous function) [as equal] (/home/matthew/github/composer/node_modules/chai/lib/chai/utils/overwriteMethod.js:49:33)
      at Context.it (test/codegen/loopbackvisitor.js:914:41)

  10) LoopbackVisitor namespaces = true #visit should use the model file of the referencing type to resolve other types:

      AssertionError: expected [ Array(9) ] to deeply equal [ Array(3) ]
      + expected - actual

       [
         {
           "acls": []
           "base": "PersistedModel"
      -    "description": "An asset named Registry"
      -    "idInjection": false
      -    "methods": []
      -    "name": "org_hyperledger_composer_system_Registry"
      -    "options": {
      -      "composer": {
      -        "fqn": "org.hyperledger.composer.system.Registry"
      -        "name": "Registry"
      -        "namespace": "org.hyperledger.composer.system"
      -        "type": "asset"
      -      }
      -      "validateUpsert": true
      -    }
      -    "plural": "org.hyperledger.composer.system.Registry"
      -    "properties": {
      -      "$class": {
      -        "default": "org.hyperledger.composer.system.Registry"
      -        "description": "The class identifier for this type"
      -        "required": false
      -        "type": "string"
      -      }
      -      "registryID": {
      -        "description": "The instance identifier for this type"
      -        "id": true
      -        "required": true
      -        "type": "string"
      -      }
      -    }
      -    "relations": {}
      -    "validations": []
      -  }
      -  {
      -    "acls": []
      -    "base": "PersistedModel"
      -    "description": "An asset named AssetRegistry"
      -    "idInjection": false
      -    "methods": []
      -    "name": "org_hyperledger_composer_system_AssetRegistry"
      -    "options": {
      -      "composer": {
      -        "fqn": "org.hyperledger.composer.system.AssetRegistry"
      -        "name": "AssetRegistry"
      -        "namespace": "org.hyperledger.composer.system"
      -        "type": "asset"
      -      }
      -      "validateUpsert": true
      -    }
      -    "plural": "org.hyperledger.composer.system.AssetRegistry"
      -    "properties": {
      -      "$class": {
      -        "default": "org.hyperledger.composer.system.AssetRegistry"
      -        "description": "The class identifier for this type"
      -        "required": false
      -        "type": "string"
      -      }
      -      "registryID": {
      -        "description": "The instance identifier for this type"
      -        "id": true
      -        "required": true
      -        "type": "string"
      -      }
      -    }
      -    "relations": {}
      -    "validations": []
      -  }
      -  {
      -    "acls": []
      -    "base": "PersistedModel"
      -    "description": "An asset named ParticipantRegistry"
      -    "idInjection": false
      -    "methods": []
      -    "name": "org_hyperledger_composer_system_ParticipantRegistry"
      -    "options": {
      -      "composer": {
      -        "fqn": "org.hyperledger.composer.system.ParticipantRegistry"
      -        "name": "ParticipantRegistry"
      -        "namespace": "org.hyperledger.composer.system"
      -        "type": "asset"
      -      }
      -      "validateUpsert": true
      -    }
      -    "plural": "org.hyperledger.composer.system.ParticipantRegistry"
      -    "properties": {
      -      "$class": {
      -        "default": "org.hyperledger.composer.system.ParticipantRegistry"
      -        "description": "The class identifier for this type"
      -        "required": false
      -        "type": "string"
      -      }
      -      "registryID": {
      -        "description": "The instance identifier for this type"
      -        "id": true
      -        "required": true
      -        "type": "string"
      -      }
      -    }
      -    "relations": {}
      -    "validations": []
      -  }
      -  {
      -    "acls": []
      -    "base": "PersistedModel"
      -    "description": "An asset named TransactionRegistry"
      -    "idInjection": false
      -    "methods": []
      -    "name": "org_hyperledger_composer_system_TransactionRegistry"
      -    "options": {
      -      "composer": {
      -        "fqn": "org.hyperledger.composer.system.TransactionRegistry"
      -        "name": "TransactionRegistry"
      -        "namespace": "org.hyperledger.composer.system"
      -        "type": "asset"
      -      }
      -      "validateUpsert": true
      -    }
      -    "plural": "org.hyperledger.composer.system.TransactionRegistry"
      -    "properties": {
      -      "$class": {
      -        "default": "org.hyperledger.composer.system.TransactionRegistry"
      -        "description": "The class identifier for this type"
      -        "required": false
      -        "type": "string"
      -      }
      -      "registryID": {
      -        "description": "The instance identifier for this type"
      -        "id": true
      -        "required": true
      -        "type": "string"
      -      }
      -    }
      -    "relations": {}
      -    "validations": []
      -  }
      -  {
      -    "acls": []
      -    "base": "PersistedModel"
      -    "description": "An asset named IdentityRegistry"
      -    "idInjection": false
      -    "methods": []
      -    "name": "org_hyperledger_composer_system_IdentityRegistry"
      -    "options": {
      -      "composer": {
      -        "fqn": "org.hyperledger.composer.system.IdentityRegistry"
      -        "name": "IdentityRegistry"
      -        "namespace": "org.hyperledger.composer.system"
      -        "type": "asset"
      -      }
      -      "validateUpsert": true
      -    }
      -    "plural": "org.hyperledger.composer.system.IdentityRegistry"
      -    "properties": {
      -      "$class": {
      -        "default": "org.hyperledger.composer.system.IdentityRegistry"
      -        "description": "The class identifier for this type"
      -        "required": false
      -        "type": "string"
      -      }
      -      "registryID": {
      -        "description": "The instance identifier for this type"
      -        "id": true
      -        "required": true
      -        "type": "string"
      -      }
      -    }
      -    "relations": {}
      -    "validations": []
      -  }
      -  {
      -    "acls": []
      -    "base": "PersistedModel"
      -    "description": "An asset named Identity"
      -    "idInjection": false
      -    "methods": []
      -    "name": "org_hyperledger_composer_system_Identity"
      -    "options": {
      -      "composer": {
      -        "fqn": "org.hyperledger.composer.system.Identity"
      -        "name": "Identity"
      -        "namespace": "org.hyperledger.composer.system"
      -        "type": "asset"
      -      }
      -      "validateUpsert": true
      -    }
      -    "plural": "org.hyperledger.composer.system.Identity"
      -    "properties": {
      -      "$class": {
      -        "default": "org.hyperledger.composer.system.Identity"
      -        "description": "The class identifier for this type"
      -        "required": false
      -        "type": "string"
      -      }
      -      "activated": {
      -        "required": true
      -        "type": "boolean"
      -      }
      -      "issued": {
      -        "required": true
      -        "type": "date"
      -      }
      -      "participant": {
      -        "description": "The identifier of an instance of participant"
      -        "required": true
      -        "type": "String"
      -      }
      -      "revoked": {
      -        "required": true
      -        "type": "boolean"
      -      }
      -      "userID": {
      -        "description": "The instance identifier for this type"
      -        "id": true
      -        "required": true
      -        "type": "string"
      -      }
      -    }
      -    "relations": {}
      -    "validations": []
      -  }
      -  {
      -    "acls": []
      -    "base": "PersistedModel"
           "description": "An asset named MyInlineAsset"
           "idInjection": false
           "methods": []
           "name": "org_acme_base_MyInlineAsset"
      
      at assertEqual (/home/matthew/github/composer/node_modules/chai/lib/chai/core/assertions.js:485:19)
      at ctx.(anonymous function) (/home/matthew/github/composer/node_modules/chai/lib/chai/utils/addMethod.js:41:25)
      at somethingMethod (/home/matthew/github/composer/node_modules/chai-things/lib/chai-things.js:97:25)
      at ctx.(anonymous function) (/home/matthew/github/composer/node_modules/chai/lib/chai/utils/overwriteMethod.js:49:33)
      at allMethod (/home/matthew/github/composer/node_modules/chai-things/lib/chai-things.js:165:25)
      at ctx.(anonymous function) (/home/matthew/github/composer/node_modules/chai/lib/chai/utils/overwriteMethod.js:49:33)
      at doAsserterAsyncAndAddThen (/home/matthew/github/composer/node_modules/chai-as-promised/lib/chai-as-promised.js:293:29)
      at .<anonymous> (/home/matthew/github/composer/node_modules/chai-as-promised/lib/chai-as-promised.js:252:17)
      at ctx.(anonymous function) [as equal] (/home/matthew/github/composer/node_modules/chai/lib/chai/utils/overwriteMethod.js:49:33)
      at Context.it (test/codegen/loopbackvisitor.js:1016:41)

  11) LoopbackVisitor namespaces = false #visit should generate Loopback model files for each type when given a model manager:
     AssertionError: expected [ Array(16) ] to have a length of 10 but got 16
      at Context.it (test/codegen/loopbackvisitor.js:101:41)

  12) LoopbackVisitor namespaces = false #visit should use the model file of the referencing type to resolve enumeration types:

      AssertionError: expected [ Array(8) ] to deeply equal [ Array(2) ]
      + expected - actual

       [
         {
           "acls": []
           "base": "PersistedModel"
      -    "description": "An asset named Registry"
      -    "idInjection": false
      -    "methods": []
      -    "name": "Registry"
      -    "options": {
      -      "composer": {
      -        "fqn": "org.hyperledger.composer.system.Registry"
      -        "name": "Registry"
      -        "namespace": "org.hyperledger.composer.system"
      -        "type": "asset"
      -      }
      -      "validateUpsert": true
      -    }
      -    "plural": "Registry"
      -    "properties": {
      -      "$class": {
      -        "default": "org.hyperledger.composer.system.Registry"
      -        "description": "The class identifier for this type"
      -        "required": false
      -        "type": "string"
      -      }
      -      "registryID": {
      -        "description": "The instance identifier for this type"
      -        "id": true
      -        "required": true
      -        "type": "string"
      -      }
      -    }
      -    "relations": {}
      -    "validations": []
      -  }
      -  {
      -    "acls": []
      -    "base": "PersistedModel"
      -    "description": "An asset named AssetRegistry"
      -    "idInjection": false
      -    "methods": []
      -    "name": "AssetRegistry"
      -    "options": {
      -      "composer": {
      -        "fqn": "org.hyperledger.composer.system.AssetRegistry"
      -        "name": "AssetRegistry"
      -        "namespace": "org.hyperledger.composer.system"
      -        "type": "asset"
      -      }
      -      "validateUpsert": true
      -    }
      -    "plural": "AssetRegistry"
      -    "properties": {
      -      "$class": {
      -        "default": "org.hyperledger.composer.system.AssetRegistry"
      -        "description": "The class identifier for this type"
      -        "required": false
      -        "type": "string"
      -      }
      -      "registryID": {
      -        "description": "The instance identifier for this type"
      -        "id": true
      -        "required": true
      -        "type": "string"
      -      }
      -    }
      -    "relations": {}
      -    "validations": []
      -  }
      -  {
      -    "acls": []
      -    "base": "PersistedModel"
      -    "description": "An asset named ParticipantRegistry"
      -    "idInjection": false
      -    "methods": []
      -    "name": "ParticipantRegistry"
      -    "options": {
      -      "composer": {
      -        "fqn": "org.hyperledger.composer.system.ParticipantRegistry"
      -        "name": "ParticipantRegistry"
      -        "namespace": "org.hyperledger.composer.system"
      -        "type": "asset"
      -      }
      -      "validateUpsert": true
      -    }
      -    "plural": "ParticipantRegistry"
      -    "properties": {
      -      "$class": {
      -        "default": "org.hyperledger.composer.system.ParticipantRegistry"
      -        "description": "The class identifier for this type"
      -        "required": false
      -        "type": "string"
      -      }
      -      "registryID": {
      -        "description": "The instance identifier for this type"
      -        "id": true
      -        "required": true
      -        "type": "string"
      -      }
      -    }
      -    "relations": {}
      -    "validations": []
      -  }
      -  {
      -    "acls": []
      -    "base": "PersistedModel"
      -    "description": "An asset named TransactionRegistry"
      -    "idInjection": false
      -    "methods": []
      -    "name": "TransactionRegistry"
      -    "options": {
      -      "composer": {
      -        "fqn": "org.hyperledger.composer.system.TransactionRegistry"
      -        "name": "TransactionRegistry"
      -        "namespace": "org.hyperledger.composer.system"
      -        "type": "asset"
      -      }
      -      "validateUpsert": true
      -    }
      -    "plural": "TransactionRegistry"
      -    "properties": {
      -      "$class": {
      -        "default": "org.hyperledger.composer.system.TransactionRegistry"
      -        "description": "The class identifier for this type"
      -        "required": false
      -        "type": "string"
      -      }
      -      "registryID": {
      -        "description": "The instance identifier for this type"
      -        "id": true
      -        "required": true
      -        "type": "string"
      -      }
      -    }
      -    "relations": {}
      -    "validations": []
      -  }
      -  {
      -    "acls": []
      -    "base": "PersistedModel"
      -    "description": "An asset named IdentityRegistry"
      -    "idInjection": false
      -    "methods": []
      -    "name": "IdentityRegistry"
      -    "options": {
      -      "composer": {
      -        "fqn": "org.hyperledger.composer.system.IdentityRegistry"
      -        "name": "IdentityRegistry"
      -        "namespace": "org.hyperledger.composer.system"
      -        "type": "asset"
      -      }
      -      "validateUpsert": true
      -    }
      -    "plural": "IdentityRegistry"
      -    "properties": {
      -      "$class": {
      -        "default": "org.hyperledger.composer.system.IdentityRegistry"
      -        "description": "The class identifier for this type"
      -        "required": false
      -        "type": "string"
      -      }
      -      "registryID": {
      -        "description": "The instance identifier for this type"
      -        "id": true
      -        "required": true
      -        "type": "string"
      -      }
      -    }
      -    "relations": {}
      -    "validations": []
      -  }
      -  {
      -    "acls": []
      -    "base": "PersistedModel"
      -    "description": "An asset named Identity"
      -    "idInjection": false
      -    "methods": []
      -    "name": "Identity"
      -    "options": {
      -      "composer": {
      -        "fqn": "org.hyperledger.composer.system.Identity"
      -        "name": "Identity"
      -        "namespace": "org.hyperledger.composer.system"
      -        "type": "asset"
      -      }
      -      "validateUpsert": true
      -    }
      -    "plural": "Identity"
      -    "properties": {
      -      "$class": {
      -        "default": "org.hyperledger.composer.system.Identity"
      -        "description": "The class identifier for this type"
      -        "required": false
      -        "type": "string"
      -      }
      -      "activated": {
      -        "required": true
      -        "type": "boolean"
      -      }
      -      "issued": {
      -        "required": true
      -        "type": "date"
      -      }
      -      "participant": {
      -        "description": "The identifier of an instance of participant"
      -        "required": true
      -        "type": "String"
      -      }
      -      "revoked": {
      -        "required": true
      -        "type": "boolean"
      -      }
      -      "userID": {
      -        "description": "The instance identifier for this type"
      -        "id": true
      -        "required": true
      -        "type": "string"
      -      }
      -    }
      -    "relations": {}
      -    "validations": []
      -  }
      -  {
      -    "acls": []
      -    "base": "PersistedModel"
           "description": "An asset named MyAsset"
           "idInjection": false
           "methods": []
           "name": "MyAsset"
      
      at assertEqual (/home/matthew/github/composer/node_modules/chai/lib/chai/core/assertions.js:485:19)
      at ctx.(anonymous function) (/home/matthew/github/composer/node_modules/chai/lib/chai/utils/addMethod.js:41:25)
      at somethingMethod (/home/matthew/github/composer/node_modules/chai-things/lib/chai-things.js:97:25)
      at ctx.(anonymous function) (/home/matthew/github/composer/node_modules/chai/lib/chai/utils/overwriteMethod.js:49:33)
      at allMethod (/home/matthew/github/composer/node_modules/chai-things/lib/chai-things.js:165:25)
      at ctx.(anonymous function) (/home/matthew/github/composer/node_modules/chai/lib/chai/utils/overwriteMethod.js:49:33)
      at doAsserterAsyncAndAddThen (/home/matthew/github/composer/node_modules/chai-as-promised/lib/chai-as-promised.js:293:29)
      at .<anonymous> (/home/matthew/github/composer/node_modules/chai-as-promised/lib/chai-as-promised.js:252:17)
      at ctx.(anonymous function) [as equal] (/home/matthew/github/composer/node_modules/chai/lib/chai/utils/overwriteMethod.js:49:33)
      at Context.it (test/codegen/loopbackvisitor.js:914:41)

  13) LoopbackVisitor namespaces = false #visit should use the model file of the referencing type to resolve other types:

      AssertionError: expected [ Array(9) ] to deeply equal [ Array(3) ]
      + expected - actual

       [
         {
           "acls": []
           "base": "PersistedModel"
      -    "description": "An asset named Registry"
      -    "idInjection": false
      -    "methods": []
      -    "name": "Registry"
      -    "options": {
      -      "composer": {
      -        "fqn": "org.hyperledger.composer.system.Registry"
      -        "name": "Registry"
      -        "namespace": "org.hyperledger.composer.system"
      -        "type": "asset"
      -      }
      -      "validateUpsert": true
      -    }
      -    "plural": "Registry"
      -    "properties": {
      -      "$class": {
      -        "default": "org.hyperledger.composer.system.Registry"
      -        "description": "The class identifier for this type"
      -        "required": false
      -        "type": "string"
      -      }
      -      "registryID": {
      -        "description": "The instance identifier for this type"
      -        "id": true
      -        "required": true
      -        "type": "string"
      -      }
      -    }
      -    "relations": {}
      -    "validations": []
      -  }
      -  {
      -    "acls": []
      -    "base": "PersistedModel"
      -    "description": "An asset named AssetRegistry"
      -    "idInjection": false
      -    "methods": []
      -    "name": "AssetRegistry"
      -    "options": {
      -      "composer": {
      -        "fqn": "org.hyperledger.composer.system.AssetRegistry"
      -        "name": "AssetRegistry"
      -        "namespace": "org.hyperledger.composer.system"
      -        "type": "asset"
      -      }
      -      "validateUpsert": true
      -    }
      -    "plural": "AssetRegistry"
      -    "properties": {
      -      "$class": {
      -        "default": "org.hyperledger.composer.system.AssetRegistry"
      -        "description": "The class identifier for this type"
      -        "required": false
      -        "type": "string"
      -      }
      -      "registryID": {
      -        "description": "The instance identifier for this type"
      -        "id": true
      -        "required": true
      -        "type": "string"
      -      }
      -    }
      -    "relations": {}
      -    "validations": []
      -  }
      -  {
      -    "acls": []
      -    "base": "PersistedModel"
      -    "description": "An asset named ParticipantRegistry"
      -    "idInjection": false
      -    "methods": []
      -    "name": "ParticipantRegistry"
      -    "options": {
      -      "composer": {
      -        "fqn": "org.hyperledger.composer.system.ParticipantRegistry"
      -        "name": "ParticipantRegistry"
      -        "namespace": "org.hyperledger.composer.system"
      -        "type": "asset"
      -      }
      -      "validateUpsert": true
      -    }
      -    "plural": "ParticipantRegistry"
      -    "properties": {
      -      "$class": {
      -        "default": "org.hyperledger.composer.system.ParticipantRegistry"
      -        "description": "The class identifier for this type"
      -        "required": false
      -        "type": "string"
      -      }
      -      "registryID": {
      -        "description": "The instance identifier for this type"
      -        "id": true
      -        "required": true
      -        "type": "string"
      -      }
      -    }
      -    "relations": {}
      -    "validations": []
      -  }
      -  {
      -    "acls": []
      -    "base": "PersistedModel"
      -    "description": "An asset named TransactionRegistry"
      -    "idInjection": false
      -    "methods": []
      -    "name": "TransactionRegistry"
      -    "options": {
      -      "composer": {
      -        "fqn": "org.hyperledger.composer.system.TransactionRegistry"
      -        "name": "TransactionRegistry"
      -        "namespace": "org.hyperledger.composer.system"
      -        "type": "asset"
      -      }
      -      "validateUpsert": true
      -    }
      -    "plural": "TransactionRegistry"
      -    "properties": {
      -      "$class": {
      -        "default": "org.hyperledger.composer.system.TransactionRegistry"
      -        "description": "The class identifier for this type"
      -        "required": false
      -        "type": "string"
      -      }
      -      "registryID": {
      -        "description": "The instance identifier for this type"
      -        "id": true
      -        "required": true
      -        "type": "string"
      -      }
      -    }
      -    "relations": {}
      -    "validations": []
      -  }
      -  {
      -    "acls": []
      -    "base": "PersistedModel"
      -    "description": "An asset named IdentityRegistry"
      -    "idInjection": false
      -    "methods": []
      -    "name": "IdentityRegistry"
      -    "options": {
      -      "composer": {
      -        "fqn": "org.hyperledger.composer.system.IdentityRegistry"
      -        "name": "IdentityRegistry"
      -        "namespace": "org.hyperledger.composer.system"
      -        "type": "asset"
      -      }
      -      "validateUpsert": true
      -    }
      -    "plural": "IdentityRegistry"
      -    "properties": {
      -      "$class": {
      -        "default": "org.hyperledger.composer.system.IdentityRegistry"
      -        "description": "The class identifier for this type"
      -        "required": false
      -        "type": "string"
      -      }
      -      "registryID": {
      -        "description": "The instance identifier for this type"
      -        "id": true
      -        "required": true
      -        "type": "string"
      -      }
      -    }
      -    "relations": {}
      -    "validations": []
      -  }
      -  {
      -    "acls": []
      -    "base": "PersistedModel"
      -    "description": "An asset named Identity"
      -    "idInjection": false
      -    "methods": []
      -    "name": "Identity"
      -    "options": {
      -      "composer": {
      -        "fqn": "org.hyperledger.composer.system.Identity"
      -        "name": "Identity"
      -        "namespace": "org.hyperledger.composer.system"
      -        "type": "asset"
      -      }
      -      "validateUpsert": true
      -    }
      -    "plural": "Identity"
      -    "properties": {
      -      "$class": {
      -        "default": "org.hyperledger.composer.system.Identity"
      -        "description": "The class identifier for this type"
      -        "required": false
      -        "type": "string"
      -      }
      -      "activated": {
      -        "required": true
      -        "type": "boolean"
      -      }
      -      "issued": {
      -        "required": true
      -        "type": "date"
      -      }
      -      "participant": {
      -        "description": "The identifier of an instance of participant"
      -        "required": true
      -        "type": "String"
      -      }
      -      "revoked": {
      -        "required": true
      -        "type": "boolean"
      -      }
      -      "userID": {
      -        "description": "The instance identifier for this type"
      -        "id": true
      -        "required": true
      -        "type": "string"
      -      }
      -    }
      -    "relations": {}
      -    "validations": []
      -  }
      -  {
      -    "acls": []
      -    "base": "PersistedModel"
           "description": "An asset named MyInlineAsset"
           "idInjection": false
           "methods": []
           "name": "MyInlineAsset"
      
      at assertEqual (/home/matthew/github/composer/node_modules/chai/lib/chai/core/assertions.js:485:19)
      at ctx.(anonymous function) (/home/matthew/github/composer/node_modules/chai/lib/chai/utils/addMethod.js:41:25)
      at somethingMethod (/home/matthew/github/composer/node_modules/chai-things/lib/chai-things.js:97:25)
      at ctx.(anonymous function) (/home/matthew/github/composer/node_modules/chai/lib/chai/utils/overwriteMethod.js:49:33)
      at allMethod (/home/matthew/github/composer/node_modules/chai-things/lib/chai-things.js:165:25)
      at ctx.(anonymous function) (/home/matthew/github/composer/node_modules/chai/lib/chai/utils/overwriteMethod.js:49:33)
      at doAsserterAsyncAndAddThen (/home/matthew/github/composer/node_modules/chai-as-promised/lib/chai-as-promised.js:293:29)
      at .<anonymous> (/home/matthew/github/composer/node_modules/chai-as-promised/lib/chai-as-promised.js:252:17)
      at ctx.(anonymous function) [as equal] (/home/matthew/github/composer/node_modules/chai/lib/chai/utils/overwriteMethod.js:49:33)
      at Context.it (test/codegen/loopbackvisitor.js:1016:41)

  14) Introspector #getClassDeclarations should return all class declarations:

      AssertionError: expected 23 to equal 17
      + expected - actual

      -23
      +17
      
      at Context.it (test/introspect/introspector.js:54:63)

  15) Test Model #ModelFile.isImportedType check that imported types are identified:

      AssertionError: expected 11 to equal 5
      + expected - actual

      -11
      +5
      
      at Context.<anonymous> (test/models/test.js:329:50)

  16) Test Model #imports check that dependencies of imported types are resolved correctly:

      AssertionError: expected 12 to equal 6
      + expected - actual

      -12
      +6
      
      at Context.<anonymous> (test/models/test.js:363:50)
