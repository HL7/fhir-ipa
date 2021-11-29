An application gets access to a patient record using the [SMART App Launch Protocol](http://hl7.org/fhir/smart-app-launch/), using the stand alone launch sequence.

### Client Process

A client application gets access a patient record by following this general sequence of steps:

* Identifying the appropriate end point [URL] at which the International Patient Access API is found. 
  * Note that this specification does not specify how the end-point might be found; different countries will have different arrangements around this 
  
* Fetch the system capability statement from [url]/metadata and check that [it implements the IPA API](conformance.html):

    ```"instantiates" : ["http://hl7.org/fhir/uv/ipa/CapabilityStatement/ipa"]```

* Fetch the [end-point configuration](http://www.hl7.org/fhir/smart-app-launch/conformance/index.html#using-well-known) from [url]/.well-known/smart-configuration.json 

* Registering itself as a client application with the end-point. 
  * This may require a manual step on the part of the user or the developer, or the end-point may support automatic registration (see [OAuth 2.0 Dynamic Client Registration Protocol](https://tools.ietf.org/html/rfc7591)). 
  * if the application supports automatic registration, the end-point will be specified in the [url]/.well-known/smart-configuration.json
  * note that most healthcare systems exercise control over which clients can access healthcare records, and automatic registration is not supported

* Follow the [Smart App Launch Protocol](http://www.hl7.org/fhir/smart-app-launch/app-launch.html#step-2-launch-standalone) using the authorization endpoint from the smart-configuration.json file

* At the end of the Smart App Launch Protocol, the application will have a token that provides access to a single patient record. Now, use that to [retrieve patient information](fetching.html)

### Scopes

Scopes work as described in the SMART on FHIR specification, but note that many servers limit a client to the scopes approved on its registration, 
and/or ignore the requested scopes at the initiation of the stand-alone launch.

### Server Obligations

Servers that are conformant to the International Patient Access API conform to the following rules:

* The server hosts a [capability statement](http://hl7.org/fhir/capabilitystatement.html) at [url]/metadata that is available to both authenticated and unauthenticated clients, and that declares that IPA is supported using [CapabilityStatement.imports](http://hl7.org/fhir/capabilitystatement-definitions.html#CapabilityStatement.imports), as shown in the following fragment:

    ```"instantiates" : ["http://hl7.org/fhir/uv/ipa/CapabilityStatement/ipa"]```
    
* The server hosts a [smart-configuration file](http://www.hl7.org/fhir/smart-app-launch/conformance.html#using-well-known) at [url]/.well-known/smart-configuration.json that is available to both authenticated and unauthenticated clients.
* The server conforms to the [SMART App Launch specification](http://hl7.org/fhir/smart-app-launch/), and checks that the authenticated user of the application has access. 
* If the client requests access to a patient record, the server checks that the authenticated user of the application has access to the specified record. 
* If the user is authorized to access multiple patient records, the server typically requires that the user choose a single patient record to which the application has access.
* The client SHALL request the `launch/patient` scope and the server SHALL return a Patient FHIR resource identifier as the `patient` [SMART launch context parameter](http://hl7.org/fhir/smart-app-launch/scopes-and-launch-context.html#patient-specific-scopes). 
* The server enforces [patient privacy and consent](privacy.html).

Note that both the CapabilityStatement and the smart configuration file may be different for authenticated and unauthenticated clients.
