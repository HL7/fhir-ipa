#Welcome to the International Patient Access API Specification

This specification describes how an application acting on behalf of a patient
can access information about the patient from an clinical records system using
a FHIR based API. The clinical records system may be supporting a clinical care 
provider (e.g. a hospital, or a general practitioner), or a health data exchange, 
including a national health record system.


## Content Format

The base version of this specification gives very little guarantees for the content accessible to the client applications.
In fact, the implementers are encouraged to return all data relevant to the patient, and let the client applications figure out how to parse the data.

The data may be HL7 FHIR data, [CDA](https://www.hl7.org/implement/standards/product_brief.cfm?product_id=7) data, data in any other format, or data in mixed formats.

Making the data accessible to the patient, regardless of its format, is valuable for a number of reasons.
* It enables technologically savy people to check their own data and analyze it in various ways, or just to keep their own backup of their data.
* It also enables the creation of apps that do that for a wider audience.
* It serves apps that may target a very specific use case and for that use case be prepared to parse many different representations of data.
* This approach also enables creation of applications that pare the data to FHIR format on behalf of systems that don't support FHIR natively.

Further profiles of the base specification are expected to build on this implementation guide, adding more detailed information on supported data formats.
These profiles make the data more accessible for an even wider range of applications.

The US Core specification can be considered such a profile, and there are likely to be several other national or regional profiles.
A profile might also be be developed for the International Patient Summary.
Yet another profile could concentrate on provenance, for the use case where a patient can be the courier of their own data from a healthcare provider to another.
See [Relationship to National Specifications](#relationship-to-national-specifications) below for further discussion.

## Relationship to National Specifications 

This International Patient Access specification describes how to access patient 
records anywhere in the world. It provides a very minimal set of access methods 
and rules about the content that are true everywhere. Working healthcare systems 
need additional rules about the access API to meet other use cases, and make many 
additional rules about the content based on national laws, regulations and accepted
practice in order to support the provision of health in their healthcare system. 

No health care system implements the International Patient Access specification 
directly; instead, each country publishes their own national patient access specification 
that is consistent with this specification. 

See [International Patient Access by Country](ipa-by-country.html) for a list of these specifications. 

In addition, there is an [International Patient Summary](http://hl7.org/fhir/uv/ips) specification which specifies
a more extensive set of rules about the content that clinical systems may conform to.
See [Relationship to the International Patient Summary](ips-relationship.html) for further details.


## Specific FHIR Resources

Using this API, applications can access the following FHIR resources for information about the patient:

* [Basic patient details](StructureDefinition-ipa-patient.html)
* [Problems / Conditions](StructureDefinition-ipa-condition.html)
* [Encounters](StructureDefinition-ipa-encounter.html)
* [Current and past medications](StructureDefinition-ipa-medicationrequest.html)
* [Immunization history](StructureDefinition-ipa-immunization.html)
* [Allergies and intolerances](StructureDefinition-ipa-allergyintolerance.html)
* [Diagnostic reports (e.g. labs, imaging)](StructureDefinition-ipa-diagnosticreport.html)
* [Vital signs and other clinical observations](StructureDefinition-ipa-observation.html)
* [Patient forms / questionnaires](StructureDefinition-ipa-questionnaireresponse.html)
* [Clinical notes & other patient documents](StructureDefinition-ipa-documentreference.html)
* [Care plans](StructureDefinition-ipa-careplan.html) and [Care teams](StructureDefinition-ipa-careteam.html)

These resources are supported by information about [practitioners](StructureDefinition-ipa-practitioner.html), 
[organizations](StructureDefinition-ipa-organization.html), [related persons](StructureDefinition-ipa-relatedperson.html), 
[locations](StructureDefinition-ipa-location.html), and [devices](StructureDefinition-ipa-device.html). 
In addition, the application can also access the [audit trail](StructureDefinition-ipa-auditevent.html) and additional
[provenance](StructureDefinition-ipa-provenance.html) information for the patient's record. 


## Using the International Patient Access API

 - [Getting access to a patient record](access.html) and doing it [in a secure fashion](security.html)
 - [Finding/retrieving information about the patient](fetching.html) (and [generating documents by request](doc-gen.html))
 - [Maintaining a synchronized copy](synchronization.html) of the patient's information and [doing it safely](safety.html)
 - [Managing privacy and consent](privacy.html)
 - [Internationalization](internationalization.html) - language and timezone issues  
 - [Application expectations, and how to test conformance](conformance.html)

Notes:
* Not [all servers provide all of this information](conformance.html)
* This  API is read-only, though implementations may [provide write access too](conformance.html).

## Where to get Support 

Todo...