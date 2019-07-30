
# Early Access Coffee on the Blockchain  

Supply chains are one great usecase for Blockchain and DLT; tracing coffee beans for example to be able to assert the provence of their origin. 
It's also a very bad pun to bridge to Java (the language).

Being a long time Java Developer (Java 1.1.3 anybody?) I'm pleased to be able to write this short guide to using Java with the Fabric SmartContract programming model. The updated programming model was first delivered within Hyperledger Fabric in Node.js (JavaScript & TypeScript) alongside a prototype Golang implementation.  
It is now available for Java developers to use - Smart Contracts AND client applications can now be written using Java 8.

This is all freshly 'brewed' code available in the last couple of weeks - so please handle with care and report back issues. We'll be wanting to 'roast' another batch of JARs very soon to feedback via rocketchat or JIRA Issues is apprecated. 

So put the coffee on (or other beverage to suit) and let's review whats available, (with no more coffee puns). Note that this is an overview of what's available and where, and not fully indepth tutorial. Please treat the Java Contract elements and Gateway SDK as 'beta' - feedback more than welcome. See the links below.


> **TL;DR**  The updated Contract programming model can be written using Java in Hyperledger Fabric!  Please treat the Java Contract elements and Gateway SDK as 'beta' - feedback more than welcome. See the links below.

## Quick Links

### Maven Repositories

For the Smart Contract use this dependency (shown in Gradle format, Maven is fine as well)

```groovy
repositories {
    mavenLocal()
    mavenCentral()
    maven {
        url 'https://jitpack.io'
    }
}

dependencies {
    compile group: 'org.hyperledger.fabric-chaincode-java', name: 'fabric-chaincode-shim', version: '1.4.2'
    compile group: 'org.json', name: 'json', version: '20180813'
}
```

For Applications use these depencies (show here in Maven format, Gradle is fine as well)

```xml
	<repositories>
		<repository>
			<id>hyperledger</id>
			<name>Hyperledger Nexus</name>
			<url>https://nexus.hyperledger.org/content/repositories/snapshots</url>
		</repository>

		<repository>
			<id>jitpack.io</id>
			<url>https://jitpack.io</url>
		</repository>
	</repositories>

	<dependencies>
		<dependency>
			<groupId>org.hyperledger.fabric-gateway-java</groupId>
			<artifactId>fabric-gateway-java</artifactId>
			<version>1.4.0-SNAPSHOT</version>
		</dependency>

		<!-- Used for datatype annotations only -->
		<dependency>
			<groupId>org.hyperledger.fabric-chaincode-java</groupId>
			<artifactId>fabric-chaincode-shim</artifactId>
			<version>${fabric-chaincode-java.version}</version>
			<scope>compile</scope>
		</dependency>

		<!-- https://mvnrepository.com/artifact/org.json/json -->
		<dependency>
			<groupId>org.json</groupId>
			<artifactId>json</artifactId>
			<version>20180813</version>
		</dependency>

	</dependencies>
```

### API References

- [Contract JavaDoc API Reference](https://fabric-chaincode-java.github.io/)
- [Contract Node.js API Reference](https://fabric-shim.github.io/release-1.4/index.html)
- [Client application JavaDoc API Reference](https://fabric-gateway-java.github.io/)
- [Client application Node.js API Reference](https://fabric-sdk-node.github.io/release-1.4/index.html)

### Code Repositories

The main code is held in Gerrit, but is mirrored (readonly) into GitHub. Issues should be raised in JIRA not Github.

- [Contract Java](https://github.com/hyperledger/fabric-chaincode-java)
- [Contract Node.js](https://github.com/hyperledger/fabric-chaincode-node)
- [Java application SDK](https://github.com/hyperledger/fabric-gateway-java)
- [Node.js application SDK](https://github.com/hyperledger/fabric-sdk-node)

### Feedback

Either contact us via [rocketchat](https://chat.hyperledger.org/channel/fabric-chaincode-dev), or via JIRA issues - for example new features ideas can be added under [this Epic](https://jira.hyperledger.org/browse/FAB-14524)

## Very Quick recap on the programming model. 

*Contracts* are defined within their own classes, with a variety of methods on them of your choice. A number of these Contracts can be run inside the *Chaincode* container that is managed in Fabric 1.4 by the *Peer*. When a client application (via a SDK) requests a transaction be executed the appropraite method on the approriate contract class will be executred. The resultant read/write set will be processed by the Orderer and Peers before being written to the ledger.

At a high level, then Smart Contracts are written based around 'Contract Classes' with 'Transaction Function' implementations. These are then invoked by the client application. 

## Language and software versions 

*Smart Contracts* The minimum Java version being targetted is *Java 8*; using the *Gradle 4.6* or *Maven* build system.  A consequence of the JavaEnv docker image that is used to run the code, is that the version of Java and Gradle has to match. i.e. Java 8 and Gradle 4.6.  Also the style of the overall contract has to follow certain conventions. 

*Application Client* Again the minimum is *Java 8*, with either *Gradle* or *Maven* or other build system of your choice.

## Getting some code

Let's get some code immediately and look at how it can be used with Hyperledger Fabric. Clone the following repo from github and load it up into your favourite editor.

```bash
git clone https://github.com/hyperledgendary/hackathon-starter.git
cd hackathon-starter
```

This is divided into two folders, firstly let's look in `basic-contract/java-contract`

 - *gradle.build* 
  
   A standard gradle build using the 'uber-jar' approach to pull all the dependencies together using the `com.github.johnrengelman.shadow`
   
   The important depencies are

   ```
       compile group: 'org.hyperledger.fabric-chaincode-java', name: 'fabric-chaincode-shim', version: '1.4.2'
       compile group: 'org.json', name: 'json', version: '20180813'
    ```
    Lastly, the main class of the JAR MUST be set to 

    ```
    manifest {
        attributes 'Main-Class': 'org.hyperledger.fabric.contract.ContractRouter'
    }
    ```

 - Contract source is in the src/main/org/example/, with Test code using Junit 5 is in `src/test/java/org/example/

This is a very simple Smart Contract, with the logic in `MyAssetContract.java` and the asset definition that is being handled in `MyAsset.java`

### SmartContract Logic

Look in  `MyAssetContract.java`.  A single Contract MUST have the following
- A class that implements the `ContractInterface`
- Two annotations `@Contract(...)` that defines information about the contract, eg license author, etc. and `@Default` that defines this contract as the default should further ones be added later
- Each class must have at least one transaction function. (it could have none, but wouldn't be very useufl).  These are marked by another annotation `@Transaction`

To look briefly at one of these transactions functions.

```Java
    @Transaction()
    public boolean myAssetExists(Context ctx, String myAssetId) {
        byte[] buffer = ctx.getStub().getState(myAssetId);
        return (buffer != null && buffer.length > 0);
    }
```
The first argument is a `Context` - this is a transactional context that contains information specific to the currently executing Fabric Transaction. It is through this object that the APIs to access the ledger are available. In this case a `getState(..)` call.

There are more functions, for read, create, update etc. 

### MyAsset

This Smart Contract is adding a very simple asset to the ledger. The asset is represented by a single class in this case, in a format very similar to a Java Bean.

In order for Fabric to handle objects passed to and from the functions, and for interop between say a TypeScript application and Java Contract we need to mark the 'complex' datatypes with an annotation. (Complex in the sense as not being a primitive or String)
```
import org.hyperledger.fabric.contract.annotation.DataType;

@DataType()
public class MyAsset {
    ...
}

```

Each property that is important for storing in the ledger or passing back to the application should be marked with `@Property()`  In this case the asset is very simple with a single String field.

```
    @Property()
    private String value;
```

### Compiling the Java Contract
At this point you can test the building of the contract

```
./gradlew build shadowJar
```

### Application 

If we now look at the Java Application and go through it in a similar manner, the directory is `basic-applications/java-app`

The `build.gradle` file here is similar though is setup to build an application. The exact manner of the build style is up to you, the key elements being the depencies.

In this case, 
```    
    dependecies {
        ...
        implementation 'org.hyperledger.fabric-gateway-java:fabric-gateway-java:1.4.0-SNAPSHOT'
        ...
    }
```
The application is contained within a single file, `org.example.App.java`; to break this application down to it's important sections.

Firstly we need to locate a 'wallet', and the 'connection profile' to let the application connect with the correct identity.
```
    String rootDir = "./_cfg";
    // Create a new file system based wallet for managing identities.
    Path walletPath = Paths.get(rootDir,"local_fabric_wallet");
    Wallet wallet = Wallet.createFileSystemWallet(walletPath);
    
    Path networkConfigPath = Paths.get(rootDir,"local_fabric_connection.json");
```
We won't cover creating those resources here, the easiest way to get those within a development context is to use the IBM Blockchain Platform VS Code extension.

Next step is to use a builder pattern to take the configuration information ahead of the first 'connect'

```
    Gateway.Builder builder = Gateway.createBuilder();
    builder.discovery(true);
    builder.identity(wallet, "admin").networkConfig(networkConfigPath);
    
    try (Gateway gateway = builder.connect()) {
        // ....
      
    } catch (Exception ex) {
      ex.printStackTrace();
    }
```

Using the try-with-resources construct we can connect to the Fabric infrastructure via the builder. The 'admin' here is hard-coded for ease of explanation.

Within the try block we can code the invocation of the transaction functions. 

```
    // create a gateway connection
    try (Gateway gateway = builder.connect()) {
   	
      // get the network and contract
      System.out.println("+++ Getting network");
      Network network = gateway.getNetwork("mychannel");

      System.out.println("+++ Getting contract");
      Contract contract = network.getContract("MyJavaContract");

      byte[] result = contract.evaluateTransaction("readMyAsset", "001");
      System.out.println(new String(result));
      
    } catch (Exception ex) {
      ex.printStackTrace();
    }
```

This code gets the network (defined in the basic development Fabric infrastructures as 'mychannel'), and connects to the Contract named 'MyJavaContract'.  Finally it invokes the 'readMyAsset' transaction function.  

That is the end of the application

## Summary so far

To recap on what's been covered so far, we have a Smart Contract that has been coded in Java. This is working on an asset `MyAsset`, and has basic create, update, delete style transaction functions. These can be accessed from a client application using a Java SDK.

Important points are are that 

- The language of the application need not be the same as the Contract.
- Either Gradle or Maven can be used as build processes for the Contract
- Make note of the depenencies that are needed, specifically the `main-class` for the Contract

## Where to go next
The next step is starting Fabric, installating the Contract and running applications against it. That's the subject of a follow-on document for this repo.

The easiest way is to use the [Blockchain Extension](https://marketplace.visualstudio.com/items?itemName=IBMBlockchain.ibm-blockchain-platform) for VS Code

  `code --install-extension ibmblockchain.ibm-blockchain-platform`

This has support for the low level of Java Chaincode, and can therefore be used to work with the higherlevel API. It doesn't as yet have the extra support for Java Contracts that is is has for Node.js

For a command line approach to driving and install Java Contracts, take a look at the Commercial Paper tutorial and the matching [fabric-samples repo](https://github.com/hyperledger/fabric-samples/tree/release-1.4/commercial-paper).  There's some notes in there about running Java Contracts.   

If you want to use the Commcercial Paper sample - going through the [very detailed Node.js tutorial](https://hyperledger-fabric.readthedocs.io/en/release-1.4/tutorial/commercial_paper.html) is a good idea first. 