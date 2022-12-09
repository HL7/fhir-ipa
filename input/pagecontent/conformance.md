<div class="bg-success" markdown="1">
IPA conformant servers SHALL support:

 - the resources as profiled by IPA to represent clinical information (Profile Support) and <span class="bg-success" markdown="1">[the RESTful FHIR API]({{site.data.fhir.path}}http.html)</span><!-- new-content --> interactions defined for it (Interaction Support)
 - the SMART on FHIR obligations and capabilities

This page documents how CapabilityStatements declare conformance to the IPA Profiles and their FHIR Interactions. It also defines the expectations for mandatory and must-support elements. The SMART on FHIR obligations and capabilities are documented on the [Gaining Access to a Patient Record](access.html) page.

Note that the conformance verbs - SHALL, SHOULD, MAY - used in this guide are defined by the [FHIR Conformance Rules](http://hl7.org/fhir/conformance-rules.html).
</div><!-- new-content -->

### Conformance Artifacts
The [Artifacts](artifacts.html) page lists the IPA Profiles that have been defined for this implementation guide. Core Profile [StructureDefinitions]({{site.data.fhir.path}}structuredefinition.html) defines the minimum elements, extensions, vocabularies and value sets which SHALL be present when using the profile. Many Profile pages also contain additional guidance.

The Profile elements consist of both Mandatory and Must Support elements. Mandatory elements are elements with a minimum cardinality of 1 (min=1). The base [FHIR Must Support]({{site.data.fhir.path}}profiling.html#mustsupport) guidance requires specifications to define exactly the support expected for profile elements labeled Must Support. The sections below explain how these elements are displayed and define the rules for interpreting profile elements and sub-elements labeled Mandatory and Must Support for requesters and responders.

<div class="bg-success" markdown="1">
#### Capability Statements 

The [International Patient Access Client CapabilityStatement](CapabilityStatement-ipa-client.html) outlines conformance requirements and expectations for the IPA Clients. {{site.data.resources['CapabilityStatement/ipa-client'].description }}

The [International Patient Access Server CapabilityStatement](CapabilityStatement-ipa-server.html) outlines conformance requirements and expectations for the IPA Clients {{site.data.resources.['CapabilityStatement/ipa-server'].description}}

Note that country-specific profiles must define terminology bindings and invariants. 
</div><!-- new-content -->

### Declaring Conformance

Servers that are conformant to the International Patient Access API declare conformance by:

* The server hosts a [capability statement](http://hl7.org/fhir/capabilitystatement.html) at [url]/metadata that is available to both authenticated and unauthenticated clients, and that declares that IPA is supported using [CapabilityStatement.instantiates](http://hl7.org/fhir/capabilitystatement-definitions.html#CapabilityStatement.instantiates), as shown in the following fragment:

    ```
    {
      "resourceType": "CapabilityStatement",
      ...
      "instantiates": [
        "http://hl7.org/fhir/uv/ipa/CapabilityStatement/ipa"
      ],
      ...  
      "rest": [
        {
          "mode": "server",
        ...
        }
      ] 
    }
    ```
Note that the CapabilityStatement may be different for authenticated and unauthenticated clients.
</div><!-- new-content -->

<div class="bg-success" markdown="1">

### Exchange Format Support

In FHIR, resources can be exchanged in the following formats: JSON, XML, and Turtle. Due to the popularity of JavaScript-based apps and ease of usage with JSON, the most popular exchange format for REST styled APIs is JSON. To increase certainty and the likelihood of interoperability, IPA mandates the support of JSON. IPA Servers are encouraged to support XML as well.
</div><!-- new-content -->

### Profile and Interaction Support
Systems deploy, and support, the IPA *profiles* to represent clinical information and the IPA RESTful *interactions* to access that information. To claim conformance to IPA, servers need to implement and support both IPA profiles and interactions.

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
In the context of IPA, the "supported flag" on any data element SHALL be interpreted to mean [FHIR's MustSupport](https://www.hl7.org/fhir/conformance-rules.html#mustSupport).  Realm-specific implementation guides may provide additional guidance. <span class="bg-success" markdown="1">However, they SHOULD clearly identify and document these differences.</span><!-- new-content -->

In situations where information on a particular data element is not present and the reason for absence is unknown, IPA Responders SHALL NOT include the data elements in the resource instance returned as part of the query results. Conversely, IPA Requestors SHALL be able to process resource instances containing data elements asserting missing information.

Must Support elements are treated differently between IPA responders and requestors. 

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

Note: an IPA responder may have no data to be included either because there are no data, or because data available are not pertinent.

###### Missing Must-Support, and Required data
If an IPA responder does not have data to be included, the reason for the absence has to be specified as follows:

1. For non-coded data elements, use the [DataAbsentReason Extension]({{site.data.fhir.path}}extension-data-absent-reason.html) in the data type.
2. For coded data elements:
  * example, preferred, or extensible binding strengths (CodeableConcept datatypes):
    * if the source systems has text but no coded data, only the text element is used.
    * if there is neither text or codes representing actual (i.e non-exceptional) concepts:
      * use the appropriate exceptional concept code from the value set if available
      * use the appropriate concept code from the [DataAbsentReason Code System] if the value set does not have it.
  * required binding strength (CodeableConcept or code datatypes):
    * use the appropriate exceptional concept code from the value set

#### Must-support means SHALL process, for requestors
Clients conforming to a profile in IPA SHALL be capable of processing resource instances containing mustSupport data elements, including elements with missing data, without generating an error or causing the application to fail. An element can be processed, for example, if the the receiving application's behavior can differ based upon the value of the element.


For example, one possible value of the [Observation.status element](StructureDefinition-ipa-observation-definitions.html#Observation.status) is `entered-in-error`. This element is marked as Must Support because requestors must be capable of processing this value in order to appropriately handle the resource's clinical data.

NOTE: Readers are advised to understand [FHIR Terminology]({{site.data.fhir.path}}terminologies.html) requirements, [FHIR RESTful API]({{site.data.fhir.path}}http.html) based on the HTTP protocol, along with [FHIR DataTypes]({{site.data.fhir.path}}datatypes.html), [FHIR Search]({{site.data.fhir.path}}search.html) and [FHIR Resource]({{site.data.fhir.path}}resource.html) formats when implementing IPA requirements.

<div class="bg-success" markdown="1">
#### Must Support - Resource References

Some elements labeled as *Must Support* reference multiple resource types or profiles (e.g., `DocumentReference.author`). IPA servers SHALL support *at least one* referenced resource or profile for each element listed in the table below. IPA client apps SHALL support *all* referenced resource or profile listed in the table below.

IPA Profile Name|Must Support Reference Element|Must Support Reference
---|---|---
IPA-MedicationRequest|MedicationRequest.reported[x]|http://hl7.org/fhir/uv/ipa/StructureDefinition/ipa-patient, http://hl7.org/fhir/uv/ipa/StructureDefinition/ipa-practitioner, http://hl7.org/fhir/uv/ipa/StructureDefinition/ipa-practitionerrole
IPA-MedicationRequest|MedicationRequest.requester|http://hl7.org/fhir/uv/ipa/StructureDefinition/ipa-practitioner, http://hl7.org/fhir/uv/ipa/StructureDefinition/ipa-practitionerrole, http://hl7.org/fhir/uv/ipa/StructureDefinition/ipa-patient
IPA-DocumentReference|DocumentReference.author|http://hl7.org/fhir/uv/ipa/StructureDefinition/ipa-practitioner, http://hl7.org/fhir/uv/ipa/StructureDefinition/ipa-practitionerrole, http://hl7.org/fhir/uv/ipa/StructureDefinition/ipa-patient
IPA-DocumentReference|DocumentReference.context.encounter|http://hl7.org/fhir/StructureDefinition/Encounter, http://hl7.org/fhir/StructureDefinition/EpisodeOfCare
IPA-MedicationStatement|MedicationStatement.context|http://hl7.org/fhir/StructureDefinition/Encounter, http://hl7.org/fhir/StructureDefinition/EpisodeOfCare
IPA-MedicationStatement|MedicationStatement.informationSource|http://hl7.org/fhir/uv/ipa/StructureDefinition/ipa-practitioner, http://hl7.org/fhir/uv/ipa/StructureDefinition/ipa-practitionerrole, http://hl7.org/fhir/uv/ipa/StructureDefinition/ipa-patient, http://hl7.org/fhir/StructureDefinition/Organization, http://hl7.org/fhir/StructureDefinition/RelatedPerson
{:.grid}

For example, when claiming conformance to the IPA DocumentReference Profile:

* IPA Responders **SHALL** be capable of providing a DocumentReference.author with a valid reference to an IPA Practitioner Profile, or an IPA PractitioneRole Profile, or an IPA Patient Profile, or any combination of them if the element is available
* IPA Requestors **SHALL** be capable of processing a DocumentReference.author with a valid reference to an IPA Practitioner Profile, IPA PractitionerRole Profile and an IPA Patient Profile.

#### Must Support - Choice of Data Types

Some elements labeled as *Must Support* allow different data types (e.g., `Observation.effective[x]`) for their content. IPA servers SHALL support *at least one* data type for each element listed in the table below. IPA client apps SHALL support *all* data types listed in the table below.

IPA Profile Name|Must Support Choice Element|Must Support Data Types
---|---|---
IPA-Immunization|Immunization.occurrence[x]|dateTime, string
IPA-MedicationRequest|MedicationRequest.reported[x]|boolean, Reference
IPA-MedicationRequest|MedicationRequest.medication[x]|CodeableConcept, Reference
IPA-Observation|Observation.effective[x]|dateTime, Period
IPA-Observation|Observation.value[x]|Quantity, CodeableConcept, string, boolean, integer, Range, time, dateTime, Period
IPA-MedicationStatement|MedicationStatement.medication[x]|CodeableConcept, Reference
IPA-MedicationStatement|MedicationStatement.effective[x]|dateTime, Period
{:.grid}

For example, when claiming conformance to the IPA Observation Profile:

* IPA Responders **SHALL** be capable of populating `Observation.effectiveDateTime` or `Observation.effectivePeriod` or both if the element is available.
* IPA Requestors **SHALL** be capable of processing `Observation.effectiveDateTime` and `Observation.effectivePeriod`

Systems **MAY** support populating and processing other choice elements not listed in the table (such as `Observation.effectiveInstant`), but this is not a requirement.

</div><!-- new-content -->