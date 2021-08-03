
Yet to be written

Note that the conformance verbs - SHALL, SHOULD, MAY - used in this guide are defined by the [FHIR Conformance Rules](http://hl7.org/fhir/conformance-rules.html).

This page defines how CapabilityStatements are used and the expectations for mandatory and must support elements. A system SHALL support the resources as profiled by IPA to represent clinical information (Profile Support) and the RESTful interactions defined for it (Profile Support + Interaction Support). 


See: [the RESTful API](http://hl7.org/fhir/R4/http.html)


## Conformance Artifacts
The [Artifacts](artifacts.html) page lists the IPA Profiles that have been defined for this implementation guide. Core Profile [StructureDefinitions](http://hl7.org/fhir/R4/structuredefinition.html) defines the minimum elements, extensions, vocabularies and value sets which SHALL be present when using the profile. Many Profile pages also contain additional guidance.

The Profile elements consist of both Mandatory and Must Support elements. Mandatory elements are elements with an minimum cardinality of 1 (min=1). The base [FHIR Must Support](http://hl7.org/fhir/R4/profiling.html#mustsupport) guidance requires specifications to define exactly the support expected for profile elements labeled Must Support. The sections below illustrate how these elements are displayed and define the rules for interpreting profile elements and subelements labeled Mandatory and Must Support for requesters and responders.

The [Capability Statement page](CapabilityStatement-ipa-server.html) outlines conformance requirements and expectations for the IPA Servers. The [IPA Server CapabilityStatement](CapabilityStatement-ipa-server.html) identifies the specific profiles and RESTful transactions that need to be supported. Note that country-specific profiles must define terminology bindings and invariants. 

## Profile Support + Interaction Support
Systems deploy, and support, the IPA Profiles to represent clinical information and the IPA RESTful interactions to access the information. Systems that implement both can claim conformance to IPA. This is done by implementing all of the IPA CapabilityStatement into their capabilities.

To claim conformance to a US Core Profile a server:

* SHALL Be able to populate all profile data elements that are mandatory and/or flagged as Must Support as defined by that profile’s StructureDefinition.
* SHALL declare conformance with the the US Core Server Capability Statement by including its official URL in the server’s CapabilityStatement.instantiates element: <todo: need a uri, here, US Core's is: http://hl7.org/fhir/uv/core/CapabilityStatement/us-core-server>
* SHALL specify the full capability details from the IPA CapabilityStatement it claims to implement.
  * Declare support for the IPA Profile by including its official URL in the server’s `CapabilityStatement.rest.resource.supportedProfile` element
  * Declare support for the IPA Profile’s FHIR RESTful transactions
    * The IPA Profile’s official or “canonical” URL can be found on each IPA Profile page

<todo: example CapabilityStatement snippet for a server conforming to the IPA Patient Profile>


## Must-support
In the context of IPA, Supported on any data element SHALL be interpreted as follows:
* Responders SHALL be capable of including the data element as part of the query results as specified by the IPA conformance resources.
* Requestors SHALL be capable of processing resource instances containing the data elements. In other words Requestors SHOULD be capable of displaying the data elements for human use or storing it for other purposes.
* In situations where information on a particular data element is not present and the reason for absence is unknown, Responders SHALL NOT include the data elements in the resource instance returned as part of the query results.
* When querying Responders, Requestors SHALL interpret missing data elements within resource instances as data not present in the Responder’s systems.
* In situations where information on a particular data element is missing and the Responder knows the precise reason for the absence of data, Responders MAY send the reason for the missing information using values from the value set where they exist or using the dataAbsentReason extension.
* Requestors SHALL be able to process resource instances containing data elements asserting missing information.

NOTE: Responders who do not have the capability to store or return a data element tagged as Supported in IPA profiles can still claim conformance to the IPA profiles per the IPA  conformance resources.
NOTE: The above definition of Supported is derived from HL7v2 concept “Required but may be empty - RE” described in HL7v2 V28_CH02B_Conformance.doc.
NOTE: Readers are advised to understand FHIR Terminology requirements, FHIR RESTful API based on the HTTP protocol, along with FHIR DataTypes, FHIR Search and FHIR Resource formats before implementing IPA requirements.
