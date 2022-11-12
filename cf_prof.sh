echo
echo ""===========================================================================""
echo "download the latest version of the validator from"
echo "https://github.com/hapifhir/org.hl7.fhir.core/releases/latest/download/validator_cli.jar"
echo "Comparing Profiles"
echo "The validator can compare profiles. To compare profiles, use the following"
echo "parameters:"
echo
echo "java -jar validator_cli.jar -compare -dest /home/user/work/ig-comparison"
echo "-version 4.0"
echo "   -ig hl7.fhir.us.carin-bb#1.1.0 -ig hl7.fhir.us.davinci-crd#1.0.0 "
echo "   -left http://hl7.org/fhir/us/carin-bb/StructureDefinition/C4BB-Patient -right"
echo "http://hl7.org/fhir/us/davinci-crd/StructureDefinition/profile-patient"
echo "Lots of parameters! Explanation:"
echo
echo "-compare: tell the validator to rin the comparison logic"
echo "-dest: folder to produce the output. This must exist, and the validator will"
echo "overwrite existing content if it needs to. The output isnt simple - see below "
echo "-version Maj.Min - the version to use. You can leave this out and let the"
echo "validator infer this, but its there so that you can compare profiles across"
echo "versions. E.g. if you specify -version 4.0, the profiles will both be treated as"
echo "R4 profiles, even if they arent"
echo "-ig - a repeating parameter that specifies the packages to load, that contain"
echo "the profiles you want to compare "
echo "-left and -right - the two profiles to compare. Theres no functional difference"
echo "between left and right, except that the comparison will keep to left and right"
echo "consistently"
echo
echo "The output starts at index.html. The output isnt simple (and may take some time"
echo "to generate)"
echo
echo "For each pair of profiles, the comparison generates a union and an"
echo "intersections. The union is that total set of things that are allowed by either"
echo "profile - thats what you could expect to read as a consumer of resources"
echo "conforming to both profiles. The intersection is the set of things that both"
echo "implementation guides allow - this is what you are required/allowed to write"
echo "into a resource if you are creating one that must conform to both profiles. Its"
echo "possible that the intersection will be empty - theres no valid instance that"
echo "can conform to both profiles. In that case, consult the IG authors. "
echo
echo "The comparison will (must) compare the sub-profiles that the profiles refer to."
echo "E.g. if both profiles on a resource such as MedicationAdministration refer to a"
echo "profile of patient, those profiles will also be compared. "
echo ""===========================================================================""
echo
#!/bin/bash
# exit when any command fails
set -e

# NA='http://tx.fhir.org'
# NA='N/A' not used for now
path=~/Downloads/validator_cli.jar # path to publisher
IG1=hl7.fhir.uv.ipa#current # path to IG Package 1 = IPA CI build
IG2=hl7.fhir.us.core#3.1.1 # path to IG Package 2 = US Core
OUT=cf_out # path to the root destination folder for individual compare folders
VERSION=4.0.1 # version of FHIR to use
# will need to iterate for each artifact in IPA package - for now prompt user for artifacts
# Get left profile from user
echo "Enter the IPA profile you want to compare (e.g., http://hl7.org/fhir/uv/ipa/StructureDefinition/ipa-patient)..."
read LEFT
echo "Enter the US Core profile you want to compare (e.g., http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient)..."
read RIGHT
echo "you entered $LEFT and $RIGHT"
sleep 2
echo "Comparing $LEFT and $RIGHT...." 
LFILENAME=$(basename $LEFT)
RFILENAME=$(basename $RIGHT)
OUT=$OUT/$LFILENAME-$RFILENAME # path to the destination folder it will overwrite existing content
mkdir -p $OUT
echo "OUT=$OUT"

echo "================================================================="
echo "=== run the validator to compare profiles ==="
echo "java -Xmx4G -jar $path -compare -dest $OUT -version $VERSION"
echo "-ig $IG1 -ig $IG2 -left $LEFT -right $RIGHT"
echo "================================================================="

java -Xmx4G -jar $path -compare -dest $OUT -version $VERSION -ig $IG1 -ig $IG2 -left $LEFT -right $RIGHT

echo "================================================================="
echo "===on exit the output folder will open up your browser ==="
echo "================================================================="

