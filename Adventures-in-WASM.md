

https://webassembly.org/getting-started/developers-guide/

Clone repo and then pull down tools.. interesting.

Query - running applications in WASM; purely in the browser

 source ./emsdk_env.sh --build=Release

 Release meaning??

https://wasmer.io/

https://www.perlin.net/


https://github.com/SolarLabRU/fabric-node-chaincode-utils

https://github.com/perlin-network/smart-contract-rs

https://github.com/hyperledger-labs/fabric-chaincode-wasm

GraalVM


Good introduction to the technology of WebAssembly
https://developer.mozilla.org/en-US/docs/WebAssembly

For compiling C/C++ to WASM
https://emscripten.org/docs/introducing_emscripten/index.html





peer lifecycle chaincode approveformyorg  --orderer localhost:17051  --ordererTLSHostnameOverride orderer.example.com \
                                          --channelID  transnet \
                                          --name wasm \
                                          -v 1  \
                                          --package-id $PACKAGE_ID \
                                          --sequence 1  \
                                          --tls  \
                                          --cafile $ORDERER_TLS_CERT

peer lifecycle chaincode checkcommitreadiness --channelID transnet --name accounts -v 1 --sequence 1   

peer lifecycle chaincode commit --orderer localhost:17050 \
                                --peerAddresses localhost:19051 --tlsRootCertFiles ${FILSCENTIA_PEER_TLS} \
                                --peerAddresses localhost:18051 --tlsRootCertFiles ${AMPRETIA_PEER_TLS} \
                                --peerAddresses localhost:16051 --tlsRootCertFiles ${AUDITORS_PEER_TLS} \
                                --ordererTLSHostnameOverride orderer.example.com \
                                --channelID transnet --name wasm -v 1 \
                                --sequence 1 \
                                --tls --cafile $ORDERER_TLS_CERT --waitForEvent 


https://sdk.dfinity.org/docs/index.html

https://medium.com/dfinity/why-webassembly-f21967076e4
https://dev.to/captainsafia/why-the-heck-is-everyone-talking-about-webassembly-455a

https://medium.com/@KevinHoffman/introducing-wapc-dc9d8b0c2223

https://superkotlin.com/kotlin-and-webassembly/



Wasm Runtimes

Wasmer
Wasmtime


https://wasmbyexample.dev/

http://adventures.michaelfbryan.com/posts/wasm-as-a-platform-for-abstraction/


i64 not supported in Node.js wasm yet
https://github.com/dcodeIO/webassembly/issues/26


When handling the data from the Wasmer library - not available to the callback
https://pkg.go.dev/github.com/wasmerio/go-ext-wasm/wasmer?tab=doc#Memory.Data

https://github.com/wasmerio/go-ext-wasm
Example 

https://docs.google.com/spreadsheets/d/1HEsKdtzDHz_Gy-wGu9Z01yDDSdawvdylu9x_tdYFMO0/edit#gid=0

Lots of discussion on https://spectrum.chat/wasmer/general?tab=posts

https://medium.com/@KevinHoffman/introducing-wapc-dc9d8b0c2223
https://blog.scottlogic.com/2019/07/15/multithreaded-webassembly.html


grpc-service-config#annotations_http_rules_only

a simple api usin gprotobuf and grpc pdoviet.wordpress.com

konsumer/node-protoc-plugin



https://github.com/stepancheg/rust-protobuf/
https://github.com/stepancheg/grpc-rust/blob/master/grpc-examples/greeter/src/bin/greeter_server.rs

fn main() {
    let s: String = "Greg".into();
    
    match &s[..] {
        "Greg" => func_1(),
        "Dave" => func_2(),
        _ => {},
    }
}  

fn func_1(){
    println!("Function 1");
}

fn func_2() {
    println!("Function 2");
}

https://stackoverflow.com/questions/41626209/iterating-generically-over-either-a-map-or-a-vector-of-2-tuples

https://rustwasm.github.io/docs/book/

https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.3.md#schemaObject

https://github.com/protocolbuffers/protobuf/blob/master/src/google/protobuf/type.proto

https://doc.rust-lang.org/stable/rust-by-example/std/hash.html
