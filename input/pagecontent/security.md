Servers and clients are encouraged to follow security best practices and requirements as outlined in [FHIR Security](https://www.hl7.org/fhir/security.html) and elsewhere.

### SMART on FHIR Capabilities
Servers SHALL support the following [SMART on FHIR capabilities](http://hl7.org/fhir/smart-app-launch/conformance.html#capabilities):
* [launch-standalone](http://hl7.org/fhir/smart-app-launch/conformance.html#launch-modes) 
* [client-public](http://hl7.org/fhir/smart-app-launch/conformance.html#client-types)
* [sso-openid-connect](http://hl7.org/fhir/smart-app-launch/conformance.html#single-sign-on)
* [context-standalone-patient](http://hl7.org/fhir/smart-app-launch/conformance.html#launch-context-for-standalone-launch)
* [perrmission-patient](http://hl7.org/fhir/smart-app-launch/conformance.html#permissions)

Servers SHOULD support the following SMART on FHIR capabilities:
* [launch-ehr](http://hl7.org/fhir/smart-app-launch/conformance.html#launch-modes)
* [context-ehr-patient](http://hl7.org/fhir/smart-app-launch/conformance.html#launch-context-for-ehr-launch)
* [client-confidential-asymmetric](http://hl7.org/fhir/smart-app-launch/conformance.html#client-types)
* [permission-offline](http://hl7.org/fhir/smart-app-launch/conformance.html#permissions)

