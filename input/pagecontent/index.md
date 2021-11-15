### Welcome to the International Patient Access API Specification

This specification describes how an application acting on behalf of a patient
can access information about the patient from an clinical records system using
a FHIR based API. The clinical records system may be supporting a clinical care 
provider (e.g. a hospital, or a general practitioner), or a health data exchange, 
including a national health record system.

Using this API, applications can access the following information about the patient:

* [Basic patient details](StructureDefinition-ipa-patient.html)
* [Problems / Conditions](StructureDefinition-ipa-condition.html)
* [Medication orders](StructureDefinition-ipa-medicationrequest.html) and [usage](StructureDefinition-ipa-medicationstatement.html)
* [Immunization history](StructureDefinition-ipa-immunization.html)
* [Allergies and intolerances](StructureDefinition-ipa-allergyintolerance.html)
* [Vital signs and other clinical observations](StructureDefinition-ipa-observation.html)
* [Clinical notes & other patient documents](StructureDefinition-ipa-documentreference.html)

These resources are supported by information about [practitioners](StructureDefinition-ipa-practitioner.html) and their [roles](StructureDefinition-ipa-practitionerrole.html).


### Relationship to National Specifications 

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

### Using the International Patient Access API

 - [Getting access to a patient record](access.html) and doing it [in a secure fashion](security.html)
 - [Finding/retrieving information about the patient](fetching.html) (and [generating documents by request](doc-gen.html))
 - [Maintaining a synchronized copy](synchronization.html) of the patient's information and [doing it safely](safety.html)
 - [Managing privacy and consent](privacy.html)
 - [Internationalization](internationalization.html) - how to best support a wide range of international applications  
 - [Application expectations, and how to test conformance](conformance.html)

Notes:
* Not [all servers provide all of this information](conformance.html)
* This  API is read-only, though implementations may [provide write access too](conformance.html).
