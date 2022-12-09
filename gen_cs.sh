#!/bin/bash
# exit when any command fails
echo "================================================================="
echo "=== This Script runs the Custom IG publisher with improved CapabilityStatement rendering  ==="
echo "=== To update the Capstatement renderings before pushing to the autobuild ==="
echo "===The custom ig-pbulishing jar is at ==="
echo "=== https://github.com/vassilpeytchev/fhir-ig-publisher/releases/tag/customPublisher.1.2.nnn-SNAPSHOT ==="
echo "===and needs to be downloaded to a local dir identified by the path variable ==="
echo "================================================================="
set -e

# NA='http://tx.fhir.org'
NA='N/A'
path=~/Downloads/publisher-1.2.23-SNAPSHOT.jar # path to publisher
IN1=input/resources/CapabilityStatement-ipa-server.json # path to the Server CapabilityStatement
IN2=input/resources/CapabilityStatement-ipa-client.json # path to the Client CapabilityStatement
OUT=out.tmp # path to the temporary output folder

echo "================================================================="
echo "=== remove the existing text element from the Capstatement in IN1 ==="
echo "======= IN1= $IN1 ==========================="
echo "======= OUT= $OUT ==========================="
echo "================================================================="
jq 'del(.text)' $IN1 > $OUT && mv $OUT $IN1
jq 'del(.text)' $IN2 > $OUT && mv $OUT $IN2

echo "================================================================="
echo "=== run the just the igpublisher ==="
echo "==To run in command line mode, run the IG Publisher like this:=="
echo "===java -jar publisher.jar -ig [source] (-tx [url]) (-packages [directory]) (-watch)
parameters:==="
echo "================================================================="

echo "================================================================="
echo "=== rename the 'input/fsh' folder to 'input/_fsh'  ==="
echo "================================================================="
trap "echo '=== rename the input/_fsh folder to input/fsh  ==='; mv input/_fsh input/fsh" EXIT
[[ -d input/fsh ]] && mv input/fsh input/_fsh

echo "================================================================="
echo "===run igpublisher just once \(no watch option\)==="
echo "================================================================="
echo java -jar ${path} -ig ig.ini -tx $NA
java -Xmx4G -jar ${path} -ig ig.ini -tx $NA

#echo open $PWD/output/index.html
#open $PWD/output/index.html

echo "================================================================="
echo "===copy capstatements from local output file to local resources file"
echo "================================================================="
cp $PWD/output/CapabilityStatement-*.json $PWD/input/resources/
#git status

echo "================================================================="
echo "===on exit the input/_fsh folder is renamed back to input/fsh"
echo "================================================================="
