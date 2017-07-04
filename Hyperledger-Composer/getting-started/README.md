# Getting Started Example logs
The logs in this directory are provided as an example of logs from both the NPM commands, and the Docker container logs. They are provided as an aid to debugging and for comparison.

These where generated from Fabric Composer version 0.4.5 on a Ubuntu 16 system.

| Log file       | Notes                                    |
| -------------  | ---------------------------------------- |
| [chain-code.log](chain-code.log)   | Logs from the chain code container |
| [docker-ps.log](docker-ps.log)    | Docker containers running after the test |
| [hlf-peer.log](hlf-peer.log)     | Logs from the Hyperledger Fabric peer|
| [npm-install.log](hlf-peer.log)  | Output from `npm install` |
| [npm-test.log](npm-test.log)     | Output from `npm test`  |

Note that the chain code container is running the Fabric Composer runtime chain code; this is the same for any business network. It is then running the JavaScript transaction functions. 
