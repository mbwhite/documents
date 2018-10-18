

API deployment of a business network

    // let idCard_PeerAdmin = new IdCard({ userName: 'PeerAdmin' }, { type: "embedded", name: "profilename" });
    // idCard_PeerAdmin.setCredentials({ certificate: 'cert', privateKey: 'key' })
    // await adminConnection.importCard('deployer-card', idCard_PeerAdmin)
  
    // // Load the Business network from disk
    // businessNetworkDefinition = await BusinessNetworkDefinition.fromDirectory( path.resolve(bnDirectory) );
  
    // // connect and deploy the business network
    // LOG.info('> Installing the Composer Runtime');
    // await adminConnection.connect(deployCardName);
    // await adminConnection.install(businessNetworkDefinition.getName());
  
    // // Start the business network on the installed runtime
    // LOG.info("> Starting Business Network on the installed Composer runtime...");
    // let cards = await adminConnection.start(businessNetworkDefinition, { networkAdmins: [ {userName : 'admin', enrollmentSecret:'adminpw'} ] });  
    // let card = cards.get('admin') 
    // await adminConnection.importCard(userCardName,card);
  
    // // don't need the adminConnection nso disconnect
    // await adminConnection.disconnect();


    let jsonData = JSON.parse(fs.readFileSync(path.resolve(__dirname,'data.json'),'utf-8'));