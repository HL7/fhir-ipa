Servers and clients <span class="bg-success" markdown="1">SHALL follow the security requirements and SHOULD follow the security best practices</span><!-- new-content --> as outlined in [FHIR Security](https://www.hl7.org/fhir/security.html) and elsewhere.

### SMART on FHIR Capabilities
<div class="bg-success" markdown="1">Servers SHALL support the following [SMART on FHIR capabilities](http://hl7.org/fhir/smart-app-launch/conformance.html#capabilities). Client apps will need to support a subset of these capabilities to function:

 * [launch-standalone](http://hl7.org/fhir/smart-app-launch/conformance.html#launch-modes)
 * [context-standalone-patient](http://hl7.org/fhir/smart-app-launch/conformance.html#launch-context-for-standalone-launch)
 * [permission-patient](http://hl7.org/fhir/smart-app-launch/conformance.html#permissions)
 * [permission-offline](http://hl7.org/fhir/smart-app-launch/conformance.html#permissions)
 * [sso-openid-connect](http://hl7.org/fhir/smart-app-launch/conformance.html#single-sign-on)
 * [client-public](http://hl7.org/fhir/smart-app-launch/conformance.html#client-types)
 * [client-confidential-asymmetric](http://hl7.org/fhir/smart-app-launch/conformance.html#client-types)


 Servers <span class="bg-success" markdown="1">and client apps</span><!-- new-content --> MAY support the other SMART on FHIR capabilities, such as:
 * [launch-ehr](http://hl7.org/fhir/smart-app-launch/conformance.html#launch-modes)
 * [context-ehr-patient](http://hl7.org/fhir/smart-app-launch/conformance.html#launch-context-for-ehr-launch)
 * [permission-user](http://hl7.org/fhir/smart-app-launch/conformance.html#permissions)
 * [client-confidential-symmetric](http://hl7.org/fhir/smart-app-launch/conformance.html#client-types)

</div><!-- new-content -->

