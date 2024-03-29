An application is authorized to access a patient record using the [SMART App Launch Protocol](http://hl7.org/fhir/smart-app-launch/)'s standalone launch sequence. See the required server and client SMART on FHIR capabilities on the [security page](security.html). The use of SMART on FHIR is described below.

### Client Process

A client application gets access to a patient record by following this general sequence of steps:



* Register itself as a client application with the endpoint. 
  * This may require a manual step on the part of the user or the developer, or the endpoint may support automatic registration (see [OAuth 2.0 Dynamic Client Registration Protocol](https://tools.ietf.org/html/rfc7591)). 
  * if the application supports automatic registration, the `[url]/.well-known/smart-configuration` will specify the endpoint.
  * Note that most healthcare systems exercise control over which clients can access healthcare records, and automatic registration is not supported.


* Identifying the appropriate endpoint (url) for the IPA-compatible API.
  * Note that this specification does not specify how to find the endpoint; different countries will have different arrangements. 

* Fetch the system capability statement from [url]/metadata and check that [it implements the IPA API](conformance.html)

* Fetch the [endpoint configuration](https://hl7.org/fhir/smart-app-launch/conformance.html#using-well-known) from `[url]/.well-known/smart-configuration`. 

* Follow the [Smart App Launch Protocol](http://www.hl7.org/fhir/smart-app-launch/app-launch.html#step-2-launch-standalone) using the authorization endpoint from the smart-configuration file and request the `launch/patient` scope. 

* At the end of the SMART App Launch Protocol, the application will have a token that provides access to a single patient record. Now, use that to [retrieve patient information](fetching.html).

### Scopes


Scopes work as described in the SMART on FHIR specification. Servers **MAY** limit clients' scopes to those configured at registration time. Servers **SHOULD** allow users to select a subset of the requested scopes at the approval time. The app **SHOULD** inspect the returned scopes and accommodate the differences from the scopes it requested and registered.


### SMART on FHIR Obligations and Capabilities:

IPA conformant servers and clients SHALL support:

 - the resources as profiled by IPA to represent clinical information (Profile Support) and [the RESTful FHIR API]({{site.data.fhir.path}}http.html) interactions defined for it (Interaction Support)
 - the SMART on FHIR obligations and capabilities

This section documents the SMART on FHIR obligations and capabilities. The [Conformance](conformance.html) page documents the support for IPA Profiles and their FHIR interactions.

#### SMART on FHIR Server Obligations
 
* The server hosts a [smart-configuration file](http://www.hl7.org/fhir/smart-app-launch/conformance.html#using-well-known) at `[url]/.well-known/smart-configuration` that is available to both authenticated and unauthenticated clients.
* Specific obligations for server support of SMART on FHIR capabilities are defined below. They include the server hosting a smart-configuration file at `[url]/.well-known/smart-configuration` that is available to both authenticated and unauthenticated clients.




#### SMART on FHIR Server Capabilities

Servers SHALL support the following [SMART on FHIR capabilities](http://hl7.org/fhir/smart-app-launch/conformance.html#capabilities):

 * [launch-standalone]
 * [context-standalone-patient]
 * [permission-patient]
 * [permission-offline]
 * [sso-openid-connect]
 * [client-public]
 * [client-confidential-asymmetric]


 Servers MAY support the other SMART on FHIR capabilities, such as:
 * [launch-ehr]
 * [context-ehr-patient]
 * [permission-user]
 * [client-confidential-symmetric]

#### SMART on FHIR Client Capabilities

Client apps will need to support a subset of the SMART on FHIR server capabilities to function:

- SHALL support [launch-standalone] or [launch-ehr] or both.
-  SHOULD support [launch-standalone] and MAY support [launch-ehr].
- Patient-facing apps SHALL support [context-standalone-patient] and SHOULD support [permission-patient].
- Apps with the technical capability to keep a secret SHALL support [client-confidential-asymmetric] and MAY support [permission-offline].
- Apps without the technical capability to keep a secret SHALL support [client-public] and SHALL NOT support [client-confidential-asymmetric].



#### SMART on FHIR Server Process

The steps described below are typically performed when a server grants access to a client: 
* The server conforms to the SMART App Launch specification and checks that the authenticated user of the application has access.
*  If the client requests access to a patient record, the server checks that the authenticated user of the application has access to the specified record.
*  If the authenticated user is authorized to access multiple patient records, the server typically requires that the user choose a single patient record to share. (A patient often has access to multiple records in the case of a parent or family caregiver).
*  The server ensures that the authenticated user has access to the record.
*  The server returns a Patient FHIR resource identifier as the patient SMART launch context parameter when authorization is granted and includes any patient/ scopes defined by the SMART App Launch Protocol.

[launch-standalone]: http://hl7.org/fhir/smart-app-launch/conformance.html#launch-modes
[context-standalone-patient]: http://hl7.org/fhir/smart-app-launch/conformance.html#launch-context-for-standalone-launch
[permission-patient]: http://hl7.org/fhir/smart-app-launch/conformance.html#permissions
[permission-offline]: http://hl7.org/fhir/smart-app-launch/conformance.html#permissions
[sso-openid-connect]: http://hl7.org/fhir/smart-app-launch/conformance.html#single-sign-on
[client-public]: http://hl7.org/fhir/smart-app-launch/conformance.html#client-types
[client-confidential-asymmetric]: http://hl7.org/fhir/smart-app-launch/conformance.html#client-types
[launch-ehr]: http://hl7.org/fhir/smart-app-launch/conformance.html#launch-modes
[context-ehr-patient]: http://hl7.org/fhir/smart-app-launch/conformance.html#launch-context-for-ehr-launch
[permission-user]: http://hl7.org/fhir/smart-app-launch/conformance.html#permissions
[client-confidential-symmetric]: http://hl7.org/fhir/smart-app-launch/conformance.html#client-types
