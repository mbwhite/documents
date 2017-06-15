
For Berty - who is a Business Analyst, skilled but not full time developer

```
$ mkdir ~/composer && cd ~/composer
$ curl -sSL https://hyperledger.github.io/composer/install-hlfv1.sh | bash
```

Will start a browser automatically...

To stop this

```
$ ~/composer/composer-cfg stop
```

To restart (maybe tomorrow or after machine reboot)
```
$ ~/composer/composer-cfg start
```

----

For Lenny - who is a developer - but wants on stable code and not contribute to Composer 

```
$ mkdir ~/composer && cd ~/composer
$ curl -sSL https://hyperledger.github.io/composer/install-hlfv1.sh | bash
```

Will start a browser automatically...which he can then close
Wants to run a sample application against the Fabric

```
$ ~/composer/composer-data/fabric-dev-scripts/createConnectionProfile.sh
```


