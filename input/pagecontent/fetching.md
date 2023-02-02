Once an application has obtained access to the patient record with a [SMART on FHIR access token](access.html), it can 
find and retrieve information about the patient. 

### Initial Patient Identity Check 

The first thing the application should do is retrieve the patient record it has obtained access to and confirm that it is about the right patient.

    GET [url]/Patient/[id]

This [read](http://hl7.org/fhir/http.html#read) returns a single FHIR Patient resource.
The details in the patient record should match what the user of the application is expecting. The application chooses how to check this, though some jurisdictions may make additional rules about how it is done. If the app suspects it has been incorrectly granted access, consider: informing the resource server owner, aborting the workflow without showing data to the current user, and looking to local jurisdictional policies for guidance.



Notes:
* A user may grant access to their or another patient's record (e.g., a family member or other patient for whom the user is an authorized representative).
* Identifying the patient is a significant challenge - and [safety issue](security.html#patient-safety), and the application should never take a correct match for granted. This step is an essential check if the client application is [synchronizing its own copy of the patient record](synchronization.html).
* Jurisdictions may have applicable laws or regulations about displaying/checking this information in the application.

### Fetching Patient Records 

Once the patient's identity is confirmed, the application can access the patient record by searching on a set of different resources, using this pattern:

    GET [url]/Condition?[params]
    
or more generally, 

    GET [url]/[Resource]?[params]

Where "[Resource]" is the name of a resource taken from the table below, and the list of parameters includes the patient identifier. (See FHIR's [RESTful API]({{site.data.fhir.path}}http.html#styleguide) for the details). Some of the lists returned from these calls will be relatively short, but some may be very long - potentially many thousands of resources for Observation and DocumentReference, for example. 

Servers will generally use [paging](http://hl7.org/fhir/http.html#paging) to manage requests for long lists of resources. 

Servers SHALL support the required search parameters and SHOULD support the recommended search parameters [documented](#supported-searches-by-resource); therefore, clients may use these required search parameters to narrow the search scope and reduce the number of resources returned. However, except for these required search parameters, servers are not obligated to support other search parameters. For this reason, clients should always check the [self link in the returned result of the search](http://hl7.org/fhir/search.html#errors) to see what parameters were processed (or consult the server's [CapabilityStatement](CapabilityStatement-ipa-server.html) in advance to know which parameters are supported). 

The application can also use the [$docref operation](OperationDefinition-docref.html) to obtain a document, or a set of documents, related to the patient. This operation is particularly useful for implementations not based on FHIR and that do not expose data as FHIR resources. It allows them to share their information with patient-facing applications.

### Supported Searches by Resource 

As defined in the [IPA Server Capability Statement](CapabilityStatement-ipa-server.html) and [IPA Client Capability Statement](CapabilityStatement-ipa-client.html), the following resources can be searched to access patient information. Required or recommended combinations of search parameters are separated by a plus sign. IPA Clients are expected to support the required search parameters for each IPA resource type they support.

For example, an IPA-compliant server returns all lab results for a single patient with: `Observation?patient=123&category=laboratory` but may not support returning all labs, vital signs, social history, surveys, exams, activities, etc, with: `Observation?patient=123`.

|Resource | Required search params| Recommended search params |
| ------- | ----------------------- | ---------------------- |
| AllergyIntolerance    | patient   | patient+clinical-status |
| Condition             | patient   | patient+category, patient+clinical-status, patient+verification-status, patient+code, patient+onset-date, patient+category+clinical-status|
| DocumentReference     | \_id, patient, patient+category, patient+type | patient+category+date, patient+status, patient+type+period |
| Immunization          | patient   | patient+date, patient+status |
| MedicationRequest     | patient   | patient+intent, patient+intent+authoredon, patient+intent+status |
| MedicationStatement   | patient   | patient+status                    |
| Observation           | patient+category, patient+code, patient+category+date     | patient+category+status, patient+code+date |
| Patient               | \_id, identifier | birthdate, family, gender, given, name, family+gender, birthdate+family, birthdate+name, gender+name |
{:.grid}


### Supporting Resources


The API also provides access to the following resources, which are referred to from the resources above and may be read directly. Servers are not required to support search functionality on Practitioner or PractitionerRole. However, if they do, they may choose to communicate only relevant information related to the patient (for example, only the practitioner's name).


* Medication
* Practitioner
* PractitionerRole

All these resources are accessed by 

    GET [url]/[type]/[id]
    
[type] is from the list above, and "[id]" is the FHIR ID obtained from clinical resources that refer directly to them.
E.g. 

    "author": {
      "reference": "Practitioner/23"
    }

Note that the API does not specify search parameters for these resources; applications only need to access them in support of existing records that refer directly to them. 

Client applications may ask for these resources to be [included](http://hl7.org/fhir/search.html#include) in the search response, but servers are not required to do this, so clients should be prepared to fetch these directly and cache them locally. 

### Generating Patient Documents


{% include doc-gen.md %}


