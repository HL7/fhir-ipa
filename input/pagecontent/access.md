An application is authorized to access a patient record using the [SMART App Launch Protocol](http://hl7.org/fhir/smart-app-launch/)'s standalone launch sequence. See required server SMART on FHIR capabilities on the ([security  page]HL7.FHIR.UV.IPA\Security - FHIR v4.0.1).

### Client Process

A client application gets access to a patient record by following this general sequence of steps:

* Identify the appropriate endpoint [url] at which the International Patient Access API is found. 
  * Note that this specification does not specify how the endpoint might be found; different countries will have different arrangements around this. 
  
* Fetch the system capability statement from [url]/metadata and check that [it implements the IPA API](conformance.html):

    ```"instantiates" : ["http://hl7.org/fhir/uv/ipa/CapabilityStatement/ipa"]```

* Fetch the [endpoint configuration](http://www.hl7.org/fhir/smart-app-launch/conformance/index.html#using-well-known) from [url]/.well-known/smart-configuration.json 

* Register itself as a client application with the endpoint. 
  * This may require a manual step on the part of the user or the developer, or the endpoint may support automatic registration (see [OAuth 2.0 Dynamic Client Registration Protocol](https://tools.ietf.org/html/rfc7591)). 
  * if the application supports automatic registration, the endpoint will be specified in the [url]/.well-known/smart-configuration.json
  * Note that most healthcare systems exercise control over which clients can access healthcare records, and automatic registration is not supported.

* Follow the [Smart App Launch Protocol](http://www.hl7.org/fhir/smart-app-launch/app-launch.html#step-2-launch-standalone) using the authorization endpoint from the smart-configuration.json file and request the `launch/patient` scope. 

* At the end of the SMART App Launch Protocol, the application will have a token that provides access to a single patient record. Now, use that to [retrieve patient information](fetching.html).

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
* If the authenticated user is authorized to access multiple patient records, the server typically requires that the user choose a single patient record to share.
* The server ensures that the authenticated user has access to the record being shared.

* The server returns a Patient FHIR resource identifier as the `patient` [SMART launch context parameter](http://hl7.org/fhir/smart-app-launch/scopes-and-launch-context.html#patient-specific-scopes) when the client is granted the `launch/patient` scope. 

Note that the CapabilityStatement may be different for authenticated and unauthenticated clients.
