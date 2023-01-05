
{% include new-content-note.md %}

### Welcome to the International Patient Access API Specification

This specification describes how an application acting on behalf of a patient
can access information about the patient from a clinical records system using
a <span class="bg-success" markdown="1">FHIR R4 based API.</span><!-- new-content --> The clinical records system may be supporting a clinical care provider (e.g., a hospital or a general practitioner), a health data exchange, 
or other system managing patient records, including a national health record system.

<div class="bg-success" markdown="1">
The IPA specification is designed to help patients access their data. In addition, implementers can use the IPA profiles and the [SMART App Launch](http://hl7.org/fhir/smart-app-launch/) specification to support clinician-facing applications and backend access to patient records.
</div><!-- new-content -->

Applications that conform to IPA can access the following information about the patient:

* [Basic patient details](StructureDefinition-ipa-patient.html)
* [Problems / Conditions](StructureDefinition-ipa-condition.html)
* [Medication orders](StructureDefinition-ipa-medicationrequest.html) and [usage](StructureDefinition-ipa-medicationstatement.html)
* [Immunization history](StructureDefinition-ipa-immunization.html)
* [Allergies and intolerances](StructureDefinition-ipa-allergyintolerance.html)
* [Vital signs, lab results, and other clinical observations](StructureDefinition-ipa-observation.html)
* [Clinical notes & other patient documents](StructureDefinition-ipa-documentreference.html)

<div class="bg-success" markdown="1">

#### Example Scenario

*Salma Kahil uses a personal health record app to track her health and assemble her records from multiple healthcare providers. Her healthcare providers support the International Patient Access API, and Salma's health record app provides a user-friendly IPA application to provide safe, quick, and reliable access to data. Because retrieving and updating her medical information from her healthcare providers is secure, fast, and simple, Salma is a more informed and engaged patient.*
</div><!-- new-content -->

#### Using the International Patient Access API

The IPA specification is designed to help patients access their data through patient-facing applications. The underlying SMART App Launch specifications have been deployed at scale for clinician-facing and backend access to patient records using EHR-integrated SMART apps  <span class="bg-success" markdown="1">This version of IPA is read-only. However, implementations may choose to provide write access. In addition, IPA implementers are encouraged to re-use IPA profiles and support additional SMART App Launch capabilities, such as the "[Clinician Access for EHR Launch](http://hl7.org/fhir/smart-app-launch/conformance.html#capability-sets)" scenario or "[Backend Services](http://hl7.org/fhir/smart-app-launch/backend-services.html)".</span><!-- new-content -->


<div class="bg-success" markdown="1">



### IPA Actors

The following actors are part of the IPA IG:

IPA Requestor
: An application that initiates a data access request to retrieve patient data. It can be thought of as the client in a client-server interaction. The terms "app", "patient app", and "client" are used interchangeably throughout this guide and are not meant to limit this actor to patient and provider apps. Payers and other users can use the same technology. Consider these terms a short-hand notation for a "user application".
<br/><br/>

IPA Responder
: A product that responds to the data access request providing patient data. It can be thought of as the server in a client-server interaction. The terms "server", "IPA FHIR server", and "EHR" are used interchangeably throughout this guide and are not meant to limit this actor to electronic health record systems. HIEs, care coordination platforms, population health systems, etc., can use the same technology. Consider these terms a short-hand notation for an "interoperable healthcare platform".
<br/><br/>

SMART on FHIR Authorization Server
: A product that responds to authentication and authorization requests as defined in the [SMART App Launch](http://hl7.org/fhir/smart-app-launch/) specification. It can be thought of as the server in a client-server interaction. The terms "Authorization server", "SMART on FHIR server", and "OAuth2.0 server" are used interchangeably throughout this guide.

### IPA Sequence Diagram

The sequence diagram in the figure below outlines a successful interaction between a patient and an IPA server to query and retrieve the patient's clinical data:

{% include img.html img="ipa-simple-sequence.svg" %}


#### How To Read this Guide

This Guide is divided into several pages listed at the top of each page in the menu bar.

- [Home](index.html)\: The home page introduces the IPA project and guide.
- [Conformance](conformance.html)\: This page describes the rules to claim conformance to this guide and defines the expectations for must-support elements in the IPA Profiles.
- Using The API:
  - [Gaining Access to a Patient Record](access.html)\: This page documents how to access a patient record securely.
  - [Finding and Retrieving Patient Information](fetching.html)\: This page documents how to find and retrieve information about a patient and generate documents on request.
  - [Synchronizing Patient Records](synchronization.html)\: This page describes how to safely maintain a synchronized copy of the patient's information.
  - [Internationalization Issues](internationalization.html)\: This page discusses how to support a wide range of international applications.
- [Security and Privacy](security.html)\: This page documents the IPA security requirements and discusses patient privacy and safety topics.
- [Artifact Index](artifacts.html)\: These pages provide detailed descriptions and formal definitions for all the FHIR objects defined in this guide.
    - [Profiles](artifacts.html#1)\: The set of Profiles that a patient can access. They contain clinical and supporting information about the patient. In addition, each Profile page includes a narrative description, guidance, and a formal definition.
    - [CapabilityStatements](artifacts.html#3)\: This page defines the expected FHIR capabilities of an IPA client and server.
    - [Operations](artifacts.html#4)\: This page defines the $docref operation for retrieving  generated documents on request. 
    - [Examples](artifacts.html#5)\: The list of all the examples used in this guide. They illustrate the data produced and consumed by systems conforming to this implementation guide. Every effort has been made to ensure that the examples are correct and valuable. However, they are neither a normative part of the specification nor fully representative of real-world examples.
- Support:
    - [Downloads](downloads.html)\: This page provides links to downloadable artifacts that developers can use to help them implement this guide.
</div><!-- new-content -->


### Relationship to National Specifications 

This International Patient Access specification describes how to access patient 
records worldwide. It provides a very minimal set of access methods 
and content rules that are true everywhere. Working healthcare systems 
may need to make additional rules about the access API to support other use cases and their national laws, regulations, and accepted
practices.

<span class="bg-success" markdown="1">Jurisdictions are encouraged to use this specification directly and may also publish their patient access specifications that further refine the profiles in this implementation guide. </span><!-- new-content -->

<span class="bg-success" markdown="1">This project intends to create and maintain a registry of FHIR implementation guides consistent with IPA as countries adopt it in their national FHIR standards.
{:.bg-info}



<div class="bg-success" markdown="1">
#### Declaring support for IPA
As jurisdiction-specific FHIR profiles proliferate, specification authors should strive to build on top of IPA to better serve their implementors, caregivers, and patients. A FHIR implementation guide declares a relationship with IPA by referencing IPA in its published CapabilityStatement. Similarly, systems can also indicate their support of IPA in their CapabilityStatement. An implementation guide or system can support IPA in two distinct manners:

1. An implementation guide is **compliant** with IPA if it requires all IPA requirements, including support for SMART on FHIR and IPA's profiles. Similarly, a system complies with IPA if it supports all of the requirements in IPA. In both cases, the CapabilityStatement communicates compliance by referencing the canonical IPA URI in its [implementationGuide element](http://hl7.org/fhir/capabilitystatement-definitions.html#CapabilityStatement.implementationGuide). 
2. An implementation guide is an instantiation of IPA if it requires only some of IPA's requirements. A system **instantiates** IPA if it supports parts of IPA. The CapabilityStatement communicates this by referencing the canonical URL of the appropriate IPA CapabilityStatement URL in its [instantiates element](http://hl7.org/fhir/capabilitystatement-definitions.html#CapabilityStatement.instantiates). 

Because the "instantiates" form of support for IPA is imprecise, implementers and users of a system or specification that instantiates IPA should ensure that the desired functionality is instantiated.
</div><!-- new-content -->

<div class="bg-success" markdown="1">
{% include ips-relationship.md %}
</div><!-- new-content -->
