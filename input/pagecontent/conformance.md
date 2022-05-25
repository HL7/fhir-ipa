Note that the conformance verbs - SHALL, SHOULD, MAY - used in this guide are defined by the [FHIR Conformance Rules](http://hl7.org/fhir/conformance-rules.html).

This page defines how CapabilityStatements are used and the expectations for mandatory and must support elements. A system SHALL support the resources as profiled by IPA to represent clinical information (Profile Support) and the RESTful interactions defined for it (Interaction Support). 


See: [the RESTful FHIR API](http://hl7.org/fhir/R4/http.html)


### Conformance Artifacts
The [Artifacts](artifacts.html) page lists the IPA Profiles that have been defined for this implementation guide. Core Profile [StructureDefinitions](http://hl7.org/fhir/R4/structuredefinition.html) defines the minimum elements, extensions, vocabularies and value sets which SHALL be present when using the profile. Many Profile pages also contain additional guidance.

The Profile elements consist of both Mandatory and Must Support elements. Mandatory elements are elements with a minimum cardinality of 1 (min=1). The base [FHIR Must Support](http://hl7.org/fhir/R4/profiling.html#mustsupport) guidance requires specifications to define exactly the support expected for profile elements labeled Must Support. The sections below illustrate how these elements are displayed and define the rules for interpreting profile elements and subelements labeled Mandatory and Must Support for requesters and responders.

The [Capability Statement page](CapabilityStatement-ipa-server.html) outlines conformance requirements and expectations for the IPA Servers as well as the specific profiles and RESTful transactions that need to be supported. Note that country-specific profiles must define terminology bindings and invariants. 

### Profile Support + Interaction Support
Systems deploy, and support, the IPA Profiles to represent clinical information and the IPA RESTful interactions to access that information. Only systems that implement both Profile Support and Interaction Support can claim conformance to IPA. 

#### Profile Support
Profile Support refers to the support of the IPA profiles, such that the system exposes FHIR resources which adhere to the IPA profiles' content model. Specifically, a server with IPA Profile Support:
* SHALL communicate all profile data elements that are mandatory by that profile’s StructureDefinition. 
* SHALL declare conformance with the IPA Server Capability Statement by including its official URL in the server’s `CapabilityStatement.instantiates` element: `http://hl7.org/fhir/uv/ipa/CapabilityStatement/ipa-server`
* SHALL specify the full capability details from the IPA CapabilityStatement it claims to implement, including declaring support for the IPA Profile by including its official URL in the server’s `CapabilityStatement.rest.resource.supportedProfile` element

Note that the IPA Profile’s official or “canonical” URL can be found on each IPA Profile page

#### Interaction Support
Interaction Support refers to a system that support the IPA RESTful interactions. Specifically, a server with IPA Interaction Support:
* SHALL implement the RESTful behavior according to the FHIR specification, including Read and Search behavior and required search parameters as defined in the [IPA CapabilityStatement](CapabilityStatement-ipa-server.html#resourcesSummary1).
* SHALL specify the full capability details from the IPA CapabilityStatement it claims to implement, including declaring support for the IPA Profile’s FHIR RESTful transactions.

### Must-support
In the context of IPA, Supported on any data element SHALL be interpreted to mean [FHIR's MustSupport](https://www.hl7.org/fhir/conformance-rules.html#mustSupport) and realm-specific implementation guides may provide additional guidance. 

In situations where information on a particular data element is not present and the reason for absence is unknown, IPA Responders SHALL NOT include the data elements in the resource instance returned as part of the query results. Conversely, IPA Requestors SHALL be able to process resource instances containing data elements asserting missing information.

Must Support elements are treated differently between IPA servers and requestors. 

#### Must-support if available, for responders
Responders conforming to a profile in IPA SHALL return a Must Support element if that element is available. 

There are a few potential reasons by a Must Support element may not be available, for example:
* Elements which are not present for a particular patient, are not available. For example, a registration system may not have the technical capability to collect and store lab results and therefore is not expected to respond with lab results when queried.
* Elements for which the requestor is not authorized are not available.
* Elements marked as Must Support in IPA may not have universal applicability from one country to the next. National or regional FHIR specifications may re-use IPA profiles, but also not require support for a given Must-Support element due to localization appropriateness. Elements may be not available if more local FHIR specifications based upon IPA remove support requirements.  

NOTE: Responders who do not have the capability to store or return a data element tagged as Supported in IPA profiles can still claim conformance to the IPA profiles per the IPA conformance resources.

##### Missing data
There are situations when information on a particular data element is missing and the source system does not know reason for the absence of data.

###### Missing Must-Support, and Optional data
 If the responder does not have data for an element with a minimum cardinality = 0 (including elements labeled Must Support), the data element SHALL be omitted from the resource.

Note: an IPS creator may have no data to be included in the IPS either because there are no data, or because data available are not pertinent with the scope of the IPS.



###### Missing Must-Support, and Required data
If an IPS creator does not have data to be included in the IPS, the reason for the absence has to be specified as follows:

1. For non-coded data elements, use the [DataAbsentReason Extension](http://hl7.org/fhir/R4/extension-data-absent-reason.html) in the data type.
2. For coded data elements:
  * example, preferred, or extensible binding strengths (CodeableConcept datatypes):
    * if the source systems has text but no coded data, only the text element is used.
    * if there is neither text or codes representing actual (i.e non-exceptional) concepts:
      * use the appropriate exceptional concept code from the value set if available
      * use the appropriate concept code from the [DataAbsentReason Code System] if the value set does not have it.
  * required binding strength (CodeableConcept or code datatypes):
    * use the appropriate exceptional concept code from the value set

#### Must-support means SHALL process, for requestors
Clients conforming to a profile in IPA SHALL be capable of processing resource instances containing mustSupport data elements, including elements with missing data, without generating an error or causing the application to fail.

For example, one possible value of the [Observation.status element](StructureDefinition-ipa-observation-definitions.html#Observation.status) is `entered-in-error`. This element is marked as Must Support because requestors must be capable of processing this value in order to appropriately handle the resource's clinical data.

NOTE: Readers are advised to understand [FHIR Terminology](http://hl7.org/fhir/R4/terminologies.html) requirements, [FHIR RESTful API](http://hl7.org/fhir/R4/http.html) based on the HTTP protocol, along with [FHIR DataTypes](http://hl7.org/fhir/R4/datatypes.html), [FHIR Search](http://hl7.org/fhir/R4/search.html) and [FHIR Resource](http://hl7.org/fhir/R4/resource.html) formats when implementing IPA requirements.
