
Yet to be written

Note that the conformance verbs - SHALL, SHOULD, MAY - used in this guide are defined in FHIR Conformance Rules.

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
<todo -- erg: https://www.hl7.org/fhir/us/core/conformance-expectations.html#must-support-elements >
