Once an application has [obtained a token that provides access to the patient record](access.html), it can 
find and retrieve information about the patient using the patient FHIR id provided as a SMART launch context parameter (alongside the access token). 

### Initial Patient Identity Check 

The first thing that the application should do is retrieve the patient record that it has obtained access to, and confirm that it is about the right patient.

    GET [url]/Patient/[id]

This [read](http://hl7.org/fhir/http.html#read) returns a single FHIR Patient resource.
The details in the patient record should match what the user of the application is expecting. The application chooses how to check this, though some jurisdictions may make additional rules about how it is done. 

Notes:
* The server may grant access to a different patient than the user (e.g. a family member)
* Correctly identifying the patient is a significant challenge - and [safety issue](safety.html), and the application should never take a correct match for granted. This is an especially important check if the client application is [synchronizing it's own copy of the patient record](synchronization.html).
* Jurisdications may have applicable law or regulation about displaying / checking this information in the application.

### Fetching Patient Records 

Once the patient identity is confirmed, the application can access the patient record by searching on a set of different resources, using this pattern:

    GET [url]/Condition?[params]
    
or more generally, 

    GET [url]/XX?[params]

Where XX is the name of a resource taken from the table below and the list of parameters includes the patient identifier initially provided during the SMART launch. Some of the lists returned from these calls will be relatively short, but some may be very long - potentially many thousands of resources for Observation and DocumentReference, for example. 

Servers will generally use [paging](http://hl7.org/fhir/http.html#paging) to manage requests for long lists of resources. 
Clients may use any of the search parameters documented below to narrow the scope of the search, and reduce the number
of resources returned, but except for the few search parameters documented clearly below, servers are not obliged to support
search parameters. For this reason, clients should always check the [self link on the search](http://hl7.org/fhir/search.html#errors) to see what parameters
were processed (or consult the [CapabilityStatement](CapabilityStatement-ipa-server.html) in advance to know which parameters are supported). 

Note that servers may decline to perform some searches unless particular parameters are specified.

### Search resources 

The following resources can be searched to access patient information:

-- table of resources and search parameters -

|Resource | Required search params| Recommend search params |
| ------- | ----------------------- | ---------------------- |
| AllergyIntolerance    | patient   | patient+clinical-status |
| Condition             | patient   | patient+category, patient+clinical-status, patient+code, patient+onset-date|
| DocumentReference     | \_id, patient, patient+category, patient+category+date | patient+status, patient+type+period |
| Immunization | date, patient, status, patient+date, patient+status	|
| MedicationRequest | authoredon, encounter, intent, patient, status, patient+intent, patient+intent+authoredon, patient+intent+encounter, patient+intent+status	|
| MedicationStatement | ?	|
| Observation | category, code, date, patient, status, patient+category+status, patient+category, patient+code, patient+category+date, patient+code+date 	|
| Patient | \_id, birthdate, family, gender, given, identifier, name, family+gender, birthdate+family, birthdate+name, gender+name |


### Supporting Resources

The API also provides access to a number of supporting resources. The following resources are referred to from the 
resources above, and may be read directly:

* Medication
* Practitioner
* PractitionerRole

All these resources are accessed by 

    GET [ur]/[type]/[id]
    
where the type is from the list above, and the [id] is retrieved from a resource obtained from the process above.
E.g. 

    "author" : {
      "reference" : "Practitioner/23"
    }

Note that the API does not specify search directly on these resources; applications only need to access these 
in support of existing records that refer directly to them. 

In order to save time, client applications may ask for these resources to be included in the search response, but
servers are not required to do this, so clients should be prepared to fetch these directly and cache them locally. 


### Server Obligations

Servers SHALL:

* Implement the IPA defined resource types.
 * Note that this does not mean that a patient always has items, but that they server is able to return them if the patient requests that they be provided. See [Must-support](conformance.html#must-support) for additional information.
