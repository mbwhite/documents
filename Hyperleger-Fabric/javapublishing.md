Formal release doc is here.. 'Hursley' Notes are here

'java-chaincode'

Update local release-1.4 branch to latest and greatest
Write a new release notes file (see ./releasesnotes/v.x.x.xx.txt)
Run the ./scripts/release.sh to update version numbers
Check changes and submit for review
Ask Ramesh to run the release bulid
Run this type of command to attempt to release to the sonatype staging repo..

./gradlew -Psigning.keyId=C2C9BB3D -Psigning.password=BlocksOnTheChain -Psigning.secretKeyRingFile=/home/matthew/.gnupg/secring.gpg -PossrhUsername=Apsw2A+A -PossrhPassword=SP5NtEYNNTEyN5qc80YTYa7jZabY+32iOFZMkv3k9+0Z uploadArchives

Go the sonatype UI, and close the published aritfact and then release it
Git tag the release with ./scripts/gittag.sh

Update to next release statues with ./scripts/preparenext.sh
Check changes and submit build

https://oss.sonatype.org/#welcome

https://repo.maven.apache.org/maven2/org/hyperledger/fabric-chaincode-java/fabric-chaincode-shim/micr