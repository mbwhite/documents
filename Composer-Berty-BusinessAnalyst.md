
For Berty - who is a Business Analyst, skilled but not full time developer

```
$ mkdir ~/composer && cd ~/composer
$ curl -sSL https://hyperledger.github.io/composer/install-hlfv1.sh | bash
```

Will start a browser automatically...

To stop this

```
$ ~/composer/composer.sh stop
```

To restart (maybe tomorrow or after machine reboot)
```
$ ~/composer/composer.sh
```

----

For Lenny - who is a developer - but wants to work on stable code and not contribute to Composer 

```
$ mkdir ~/composer && cd ~/composer
$ curl -sSL https://hyperledger.github.io/composer/install-hlfv1.sh | bash
```

Will start a browser automatically...which he can then close
Wants to run a sample application against the Fabric

```
$ ~/composer/composer-data/fabric-dev-scripts/createConnectionProfile.sh
```

---

For when Lenny wants to run on the latest code because of a bug fix that has gone in

```
$ mkdir ~/composer && cd ~/composer
$ curl -sSL https://hyperledger.github.io/composer/install-hlfv1-unstable.sh | bash
```

---

For Charlotte who wants to contribute and run the very latest code

```
$ mkdir ~/composer && cd ~/composer
$ curl -sSL https://hyperledger.github.io/composer/unstable/install-hlfv1-unstable.sh | bash
```



