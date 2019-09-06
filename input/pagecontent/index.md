#Welcome to the International Patient Access API Specification

This specification describes how an application acting on behalf of a patient
can access information about the patient from an clinical records system using
a FHIR based API. The clinical records system may be supporting a clinical care 
provider (e.g. a hospital, or a general practitioner), or a health data exchange, 
including a national health record system.

Using this API, applications can access the following information about the patient:

* [Basic patient details](ipa-patient.html)
* [Problem list](ipa-condition.html)
* [Encounters](ipa-encounter.html)
* [Current and past medications](ipa-medicationrequest.html)
* [Immunization history](ipa-immunization.html)
* [Allergies and intolerances](ipa-allergyintolerance.html)
* [Diagnostic reports (e.g. labs, imaging)](ipa-diagnosticreport.html)
* [Vital signs and other clinical observations](ipa-observation.html)
* [Patient forms / questionnaires](ipa-questionnaireresponse.html)
* [Clinical notes & other patient documents](ipa-documentreference.html)
* [Care plans](StructureDefinition-careplan.html) and [Care teams](ipa-careteam.html)

These resources are supported by information about [practitioners](ipa-practitioner.html), 
[organizations](ipa-organization.html), [related persons](ipa-relatedperson.html), 
[locations](ipa-location.html), and [devices](ipa-device.html). 
In addition, the application can also access the [audit trail](ipa-auditevent.html) and additional
[provenance](ipa-provenance.html) information for the patient's record. 

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

## Using the International Patient Access API

 - [Getting access to a patient record](access.html) and doing it [in a secure fashion](security.html)
 - [Finding/retrieving information about the patient](fetching.html) (and [generating documents by request](doc-gen.html))
 - [Maintaining a synchronized copy](synchronization.html) of the patient's information and [doing it safely](safety.html)
 - [Managing privacy and consent](privacy.html)
 - [Internationalization](internationalization.html) - language and timezone issues  
 - [Application expectations, and how to test conformance](conformance.html)

Notes:
* Not [all servers provide all of this information](conformance.html)
* This  API is read-only, though implementations may [provide write access too](conformance.html#writing).

## Where to get Support 

Todo...