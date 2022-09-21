{% include new-content-note.md %}

### Welcome to the International Patient Access API Specification

This specification describes how an application acting on behalf of a patient
can access information about the patient from a clinical records system using
a FHIR-based API. The clinical records system may be supporting a clinical care
provider (e.g. a hospital, or a general practitioner), a health data exchange, 
or other system managing patient records, including a national health record system.

<div class="bg-success" markdown="1">
The IPA specification is designed to help patients access their data. However, implementers can use the IPA profiles and the [SMART App Launch](http://hl7.org/fhir/smart-app-launch/) specification to support clinician-facing and backend-access to patient records too.
</div><!-- new-content -->

Using this API, applications can access the following information about the patient:

* [Basic patient details](StructureDefinition-ipa-patient.html)
* [Problems / Conditions](StructureDefinition-ipa-condition.html)
* [Medication orders](StructureDefinition-ipa-medicationrequest.html) and [usage](StructureDefinition-ipa-medicationstatement.html)
* [Immunization history](StructureDefinition-ipa-immunization.html)
* [Allergies and intolerances](StructureDefinition-ipa-allergyintolerance.html)
* [Vital signs, lab results, and other clinical observations](StructureDefinition-ipa-observation.html)
* [Clinical notes & other patient documents](StructureDefinition-ipa-documentreference.html)

These resources are supported by information about [practitioners](StructureDefinition-ipa-practitioner.html) and their [roles](StructureDefinition-ipa-practitionerrole.html).


### Using the International Patient Access API

The IPA specification is designed to help patients access their own data through any app of their choice. The underlying SMART App Launch specifications have also been deployed at scale for clinician-facing and backend access to patient records using EHR-integrated SMART apps.  <span class="bg-success" markdown="1"> Note that this API is *read-only*, though implementations may provide write access too. In addition, IPA implementers are encouraged to re-use IPA profiles and support additional SMART App Launch capabilities, such as the "[Clinician Access for EHR Launch](http://hl7.org/fhir/smart-app-launch/conformance.html#capability-sets)" scenario or "[Backend Services](http://hl7.org/fhir/smart-app-launch/backend-services.html)".</span><!-- new-content -->


<div class="bg-success" markdown="1">

#### Actors and Sequence Diagram

The sequence diagram in the figure below outlines a successful interaction between a patient and an IPA server to query and retrieve the patient's clinical data:

{% include img.html img="ipa-simple-sequence.svg" %}


#### How To Read this Guide

This Guide is divided into several pages which are listed at the top of each page in the menu bar.

- [Home](index.html)\: The home page introduces the IPA project and guide.
- [Conformance](conformance.html)\: This page describes the rules to claim conformance to this guide and defines the expectations for must-support elements in the IPA Profiles.
- Using The API:
  - [Gaining Access to a Patient Record](access.html)\: This page documents how to access a patient record securely.
  - [Finding and Retrieving Patient Information](fetching.html)\: This page documents how to find and retrieve information about a patient and generate documents on request.
  - [Synchronizing Patient Records](synchronization.html)\: This page describes how to maintain a synchronized copy of the patient's information safely.
  - [Internationalization Issues](internationalization.html)\: This page discusses how to best support a wide range of international applications.
- [Security](security.html)\: This page documents the IPA security requirements and discusses patient privacy and safety topics.
- [Artifact Index](artifacts.html)\: These pages provides detailed descriptions and formal definitions for all the FHIR objects defined in this guide.
    - [Profiles](artifacts.html#1)\: The set of Profiles that a patient can access. They contain clinical and supporting information about the patient. In addition, each Profile page includes a narrative description, guidance, and a formal definition.
    - [CapabilityStatements](artifacts.html#3)\: This page defines the expected FHIR capabilities of an IPA server.
    - [Operations](artifacts.html#4)\: This page defines the $docref operation for retrieving  generated documents on request. 
    - [Examples](artifacts.html#5)\: The list of all the examples used in this guide. These examples show what data produced and consumed by systems conforming with this implementation guide might look like. Every effort has been made to ensure that the examples are correct and valuable. However, they are not a normative part of the specification, nor are they fully representative of real-world examples.
- Support:
    - [Downloads](downloads.html)\: This page provides links to downloadable artifacts that developers can use to help them implement this guide.
</div><!-- new-content -->


### Relationship to National Specifications 

This International Patient Access specification describes how to access patient 
records anywhere in the world. It provides a very minimal set of access methods 
and rules about the content that are true everywhere. Working healthcare systems 
may need additional rules about the access API to meet other use cases, and may make many 
additional rules about the content based on national laws, regulations and accepted
practice in order to support the provision of health in their healthcare system. 

Jurisdictions are encouraged to use this specification directly and may also publish their own patient access specifications that further refine the profiles in this implementation guide. 

<span class="bg-success" markdown="1">This project intends to create and maintain a registry of FHIR implementation guides consistent with IPA as countries adopt it in their national FHIR standards.
{:.bg-info}

</span><!-- new-content -->

<div class="bg-success" markdown="1">
{% include ips-relationship.md %}
</div><!-- new-content -->
