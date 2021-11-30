Note that the conformance verbs - SHALL, SHOULD, MAY - used in this guide are defined by the [FHIR Conformance Rules](http://hl7.org/fhir/conformance-rules.html).

This page defines how CapabilityStatements are used and the expectations for mandatory and must support elements. A system SHALL support the resources as profiled by IPA to represent clinical information (Profile Support) and the RESTful interactions defined for it (Profile Support + Interaction Support). 


See: [the RESTful API](http://hl7.org/fhir/R4/http.html)


### Conformance Artifacts
The [Artifacts](artifacts.html) page lists the IPA Profiles that have been defined for this implementation guide. Core Profile [StructureDefinitions](http://hl7.org/fhir/R4/structuredefinition.html) defines the minimum elements, extensions, vocabularies and value sets which SHALL be present when using the profile. Many Profile pages also contain additional guidance.

The Profile elements consist of both Mandatory and Must Support elements. Mandatory elements are elements with a minimum cardinality of 1 (min=1). The base [FHIR Must Support](http://hl7.org/fhir/R4/profiling.html#mustsupport) guidance requires specifications to define exactly the support expected for profile elements labeled Must Support. The sections below illustrate how these elements are displayed and define the rules for interpreting profile elements and subelements labeled Mandatory and Must Support for requesters and responders.

The [Capability Statement page](CapabilityStatement-ipa-server.html) outlines conformance requirements and expectations for the IPA Servers as well as the specific profiles and RESTful transactions that need to be supported. Note that country-specific profiles must define terminology bindings and invariants. 

### Profile Support + Interaction Support
Systems deploy, and support, the IPA Profiles to represent clinical information and the IPA RESTful interactions to access the information. Systems that implement both can claim conformance to IPA. This is done by implementing all of the IPA CapabilityStatement into their capabilities.

To claim conformance to an IPA Profile a server:
* SHALL be able to communicate all profile data elements that are mandatory and/or flagged as Must Support as defined in the below definition of Must Support and by that profile’s StructureDefinition. 
* SHALL declare conformance with the the IPA Server Capability Statement by including its official URL in the server’s `CapabilityStatement.instantiates` element: `http://hl7.org/fhir/uv/ipa/CapabilityStatement/ipa-server`
* SHALL specify the full capability details from the IPA CapabilityStatement it claims to implement.
  * Declare support for the IPA Profile by including its official URL in the server’s `CapabilityStatement.rest.resource.supportedProfile` element
  * Declare support for the IPA Profile’s FHIR RESTful transactions
    * The IPA Profile’s official or “canonical” URL can be found on each IPA Profile page

### Must-support
In the context of IPA, Supported on any data element SHALL be interpreted to mean [FHIR's MustSupport](https://www.hl7.org/fhir/conformance-rules.html#mustSupport) and realm-specific implementation guides are expected to provide additional guidance as appropriate. Generally, implementations are expected to: 
* be capable of including supported data elements as part of the query results as specified by the IPA conformance resources.
* interpret missing, supported data elements within resource instances as data not present in the Responder’s systems (or that the requestor is unauthorized).

For example, a registration system may not have the technical capability to collect and store lab results and therefore is not expected to respond with lab results when queried.

In situations where information on a particular data element is not present and the reason for absence is unknown, IPA Responders SHALL NOT include the data elements in the resource instance returned as part of the query results. Conversely, IPA Requestors SHALL be able to process resource instances containing data elements asserting missing information.


NOTE: Responders who do not have the capability to store or return a data element tagged as Supported in IPA profiles can still claim conformance to the IPA profiles per the IPA  conformance resources.

NOTE: Readers are advised to understand [FHIR Terminology](http://hl7.org/fhir/R4/terminologies.html) requirements, [FHIR RESTful API](http://hl7.org/fhir/R4/http.html) based on the HTTP protocol, along with [FHIR DataTypes](http://hl7.org/fhir/R4/datatypes.html), [FHIR Search](http://hl7.org/fhir/R4/search.html) and [FHIR Resource](http://hl7.org/fhir/R4/resource.html) formats when implementing IPA requirements.
