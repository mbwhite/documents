# Getting Contract Logs from IBM Blockchain Platform

**The Problem:** with IBM Blockchain Platform running in a Kubernetes cluster how do you get the logs to find out what happened with your contract?

## Setup

This is command line stuff, so make sure that you have the `kubectl` command installed and it's able to access the K8S Cluster. Or alternatively use the 'web cli'.. your choice. Access either from the 'Actions...' menu on the clustser summary page. ![](.\_imgs\ibp-logs-cluster-dashboard.png)


## The steps

### What is the k8s namespace?
Within K8S, each IBP instance has it's own namespace which you need to know. Saves guessing what it is from a list later on. Easiest way to find this is to first to get the 'ServiceID' of the IBP installation. 

Go to the IBP instance from the Resource List, and note the Service ID
![](./_imgs/ibp-log-serviceid.png). In my case it's 7a4c1452-7572-4d57-8006-510f0c152dfc  (double clcik the string to copy it)

Now to the command line using the service id, you can get the namespace.

```bash
kubectl get ns -l name=7a4c1452-7572-4d57-8006-510f0c152dfc
NAME      STATUS   AGE
nbe307c   Active   84d
```

### What pods are there?

Using the namespace helps limit the list of pods. The prefixs of the names should look familar if you've done anything with IBP or Fabric before. 

```
kubectl --namespace=nbe307c get pods                             

NAME                                   READY   STATUS    RESTARTS   AGE
ibp-operator-58595bff67-bqlk7          1/1     Running   0          18d
orderingorgca-576b46cfc-87rmm          1/1     Running   0          2d
orderingservicenode1-96cd78fc6-kkxq7   2/2     Running   0          31h
org1ca-9b74dd4fd-fwzc9                 1/1     Running   0          2d
org1peer-5d6898fd99-hnrsm              5/5     Running   0          2d
org2ca-6dcbf66d57-kwkvs                1/1     Running   0          2d
org2peer-64cd465987-92ch7              5/5     Running   0          2d
```

We're interested in the peers in this case. For the chaincode I've got running here I know that it's on both peers, so going to use `org1peer-5d6898fd99-hnrsm` as the name of the pod we're interested in 

It's helpful to know now whether the peer is a v1.4.7 (the current default) or if it's been updated to v2.1.1.  To help find out if you want to check copy the name of the one of the pods with a peer, 

```bash
kubectl --namespace=nbe307c describe pod org1peer-5d6898fd99-hnrsm | grep ibp-peer
   
    Image:          us.icr.io/ibp2/ibp-peer:1.4.7-20200618-amd64
```
So we know this is 1.4.7.  v2.1.1 would have shown `us.icr.io/ibp2/ibp-peer:2.1.1-20200618-amd64`

### Getting the logs
Time for the main event! 

*For v1.4.7:* Using the namespace, and the name of the pod, let's get the chaincode logs. We'll route it to a file for later reading.

```bash
kubectl --namespace=nbe307c logs org1peer-5d6898fd99-hnrsm chaincode-logs > ibp.log
```

The peer log can also be interesting and useful that can be accessed by changing the `chaincode-logs` to `peer`


*For v2.1.1 peers:* You will probably have already noticed something different in the list of pods. 
```
kubectl --namespace=nca6559 get pods                                               
NAME                                                       READY   STATUS    RESTARTS   AGE
chaincode-execution-35bccce6-865c-4337-b80c-d16b651213fb   1/1     Running   0          29h
ibp-operator-c57d88665-cjswx                               1/1     Running   0          31h
orderingorgca-576b46cfc-cn5cn                              1/1     Running   0          30h
orderingservicenode1-59479765f6-p7p6h                      2/2     Running   0          30h
org1ca-9b74dd4fd-9qfp2                                     1/1     Running   0          30h
org1peer-668588f746-kdbr4                                  4/4     Running   0          29h
org2ca-6dcbf66d57-czq7c                                    1/1     Running   0          29h
org2peer-6664fb876b-wdh66                                  4/4     Running   0          29h
```

In this case the first pod, `chaincode-execution-35bccce6-865c-4337-b80c-d16b651213fb` is where the chaincode is running. Each chaincode gets it's own pod. 
To access the logs it's a similar command

```bash
kubectl --namespace=nca6559 logs chaincode-execution-35bccce6-865c-4337-b80c-d16b651213fb > ibp.log
```

Likewise the peer log:

```bash
kubectl --namespace=nca6559 logs org1peer-668588f746-kdbr4 peer > peer.log
```

### Reading the logs
Reading log files can be a bit tricky, there's lots in there some useful, some not-so-useful all depending on what you know about the system and what's wrong. 

For chaincode there are two phases (1) when the code is being built and (2) when it's up and running.

Failures of chaincode 'to just install and instantiate' probably mean that the first, building, hasn't worked. Maybe a compilation error has crept in, or a NPM install failed etc. In a Hyperledger Fabric Dev environment it can be hard to capture this log, but in IBP it is captured. 

For a v1.4.7 it's all in the log file from `chaincode-logs`, for v2.1.1 look in the peer log. So if you contract or chaincode has just not started look here first. Usually any compilation or similar will be visible. 

For anything else when it's up and running, again for v1.4.7 it's `chaincode-logs`, and for v2.1.1 it's the log from the `chaincode-execution` pod.

### But the log looks a bit different from Fabric?

Bet you're looking at the v1.4.7 log? Yes well it's 'envelope logged'. The log is there just been wrapped in another log file. So either you can use this is an execuse to learn that scripting language you've always wanted to try.  Or you can cheat and use the one I've written already - go to [github.com/ampretia/ibp-chaincode-log](https://github.com/ampretia/ibp-chaincode-log) for the info. 

It's a node.js tool, so assuming you've node.js installed; using the same namespace and peer pod name as above...

```bash
npm install -g @ampretia/ibp-chaincode-log
kubectl --namespace=nbe307c logs org1peer-7ccbd7c5f6-7k55d -c chaincode-logs > ibp.log
ibpccl --file ibp.log 
```

The output will be a lot cleaner - note that v2.1.1 doesn't need this. 