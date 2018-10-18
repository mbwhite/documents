


## Container

Class representing the chaing code container hosting the JS Engine

## DataService

Represents the DataService that is offered by a container. 

- Allows access to a set of **DataCollections** by _id_ for creation, and deletion
- Query across all **DataCollections**

## DataCollection

The basic data structure provided by the **DataService**.  This provides map-style operations for persist data

For example, the add operation

    /**
     * Add an object to the collection.
     * @abstract
     * @param {string} id The ID of the object.
     * @param {Object} object The object.
     * @param {boolean} force Whether to force creation without checking it already exists.
     * @return {Promise} A promise that will be resolved when complete, or rejected
     * with an error.
     */
    add(id, object, force) {
        // ....
    }

## Registry

Value-add data structure built on-top of the other structures to provide value to persist objects.

- Comprises a **DataCollection**, **Serializer**, **AccessController**
- Identified by a **Type**, **ID**, **Name**.
  - There are some instances of registries that are for Composer ('system') use only. These are marked by a **system** boolean
- A Registry's API works at the **Resource** level

When working with a Resource, the Registry will use the AccessController to validate that the current participant and identity combination has suitable permission to perform the current operations on the Resource and Registry

The Registry uses the Serializer to convert the Resource in a canonical JSON form to persist with the DataCollection

For example to add a resource the follow is the pseduo code of the algorthm

    /**
     * Add the specified resource to this registry.
     * @param {Resource} resource The resource to add to this registry.
     * @param {Object} [options] Options for processing the resources.
     * @param {boolean} [options.convertResourcesToRelationships] Permit resources
     * in the place of relationships, defaults to false.
     * @return {Promise} A promise that will be resolved when complete, or rejected
     * with an error.
     */
    add(resource, options) {

        accessController.check(resource, 'CREATE')
            .then {
                let id = resource.getIdentifier()
                let object = serializer.toJSON(resource, options)                
                dataCollection.add(id, object)
            }
            .then { 
                emitEvent with => 'resourceadded', registryDetails, resourceDetails
            }
            .then {
                return promise
            }
    }

