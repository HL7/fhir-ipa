Servers and clients are encouraged to follow security best practices and requirements as outlined in [FHIR Security](https://www.hl7.org/fhir/security.html) and elsewhere.

### SMART on FHIR Capabilities
Servers SHALL support the following [SMART on FHIR capabilities](http://hl7.org/fhir/smart-app-launch/conformance/index.html#smart-on-fhir-core-capabilities-and-capability-sets):
* launch-standalone
* client-public
* sso-openid-connect
* context-standalone-patient
* perrmission-patient

Servers SHOULD support the following SMART on FHIR capabilities:
* launch-ehr
* context-ehr-patient
* client-confidential-asymmetric
* permission-offline

