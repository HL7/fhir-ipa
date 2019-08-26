Welcome to the International Patient Access API Specification

This specification describes how an application acting on behalf of a patient
can access information about the patient from an clinical records system using
a FHIR based API. The clinical records system may be supporting a clinical care 
provider (e.g. a hospital, or a general practitioner), or a health data exchange, 
including a national health record system.

Using this API, applications can access the following information about the patient:

* basic identification details
* problem list
* past encounters
* current and past medications
* immunization history
* allergies and intolerances 
* Diagnostic reports (e.g. labs, imaging)
* vital signs and other clinical observations
* patient forms / questionnaires
* clinical notes & other patient documents
* care plans and care teams

In addition, the application can also access the Audit Trail and additional
provenance information for the patient's record. 

Note that this  API is read-only, though implementations may [provide write access too](writing.html).

= Relationship to National Specifications =

The International Patient Access specification describes how to access patient 
records anywhere in the world. It provides a very minimal set of access methods 
and rules about the content that are true everywhere. Working healthcare systems 
need additional rules about the access to meet other use cases, and make many 
additional rules about the content based on national laws, regulations and accepted
practice in order to support their own healthcare system. 

No health care system implements the International Patient Access specification 
directly; instead, each country publishes their own national patient access specification 
that is consistent with this specification. 

See [International Patient Access by Country](ipa-by-country.html) for a list of these specifications. 

In addition, there is an [International Patient Summary](http://hl7.org/fhir/uv/ips) specification which specifies
a more extensive set of rules about the content that clinical systems may conform to.
See [Relationship to the International Patient Summary](ips-relationship.html) for 

= Using the International Patient Access API =

 - [getting access to a patient record](access.html) while [in a secure fashion](security.html)
 - [finding/retrieving information about the patient](fetching.html) (and [generating documents by request](doc-gen.html))
 - [maintaining a synchronized copy](synchronization.html) of the patient's information and [doing it safely](safety.html)
 - [Managing privacy and consent](privacy.html)
 - [Internationalization](internationalization.html) - language and timezone issues  
 - [Application expectations, and how to test conformance](conformance.html), 

= Where to get Support =

Todo...