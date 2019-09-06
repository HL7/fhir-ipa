Once an application has [obtained a token that provides access to the patient record](access.html]), it can 
find and retrieve information about the patient. 

## Initial Patient Identity Check 

The first thing that the application should do is retrieve the patient record that it has obtained access to,
and confirm that it is about the right patient.

    GET [url]/Patient

This [search](http://hl7.org/fhir/http.html#search) should return a [Bundle](http://hl7.org/fhir/bundle.html) with a single Patient record.
The details in the patient record should match what the user of the application is expecting. The application chooses how to check this, though some jurisdictions may make additional rules about how it is done. 

Notes:
* the server may grant access to a different patient than the user (e.g. a fmaily member)
* correctly identifying the patient is a significant challenge - and [safety issue](safety.html), and the application should never take a correct match for granted
* Jurisdications may have applicable law or regulation about displaying / checking this information in the application

This is an especially important check if the client application is [synchronizing it's own copy of the patient record](synchronization.html).

# Fetching Patient Records 

Once the patient identity is confirmed, the application can access the patient record by searching on a set of different resources, using this pattern:

    GET [url]/Condition
    
or more generally, 

    GET [url]/XX

Where XX is the name of a resource taken from the table below. No patient needs to be identified, since the application only has 
access to the records of a single patient. Some of the lists returned from these calls will be relatively short, but some may 
be very long - potentially many thousands of resources for Observation and DocumentReference, for example. 

Servers will generally use [paging](http://hl7.org/fhir/http.html#paging) to manage requests for long lists of resources. 
Clients may use any of the search parameters documented below to narrow the scope of the search, and reduce the number
of resources returned, but except for the few search parameters documented clearly below, servers are not obliged to support
the search parameters. For this reason, clients should always check the [self link on the search](http://hl7.org/fhir/search.html#errors) to see what parameters
were process (or consult the [CapabilityStatement](xx.html) in advance to know which parameters are supported). 

Note that servers may decline to perform some searches unless particular parameters are specified - (more details needed)

# Search resources 

The following resources can be searched to access patient information:

-- table of resources and search parameters -

# Supporting Resources

The API also provides access to a number of supporting resources. The following resources are referred to from the 
resources above, and may be read directly:

* list

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

# Audit Trail and Provenance

These resources are special. Servers are required to support the mandatory search parameters ```entity``` and ```target```
which restrict the information provided to the specified resource:

    GET [url]/AuditEvent?entity=Condition/23
    
This returns all the audit information that is associated with the specified resources. Servers may also support 
general query without the specific parameter, e.g.:

    GET [url]/AuditEvent?date=2018-05 
    
This is a request to return all the audit events for May 2018. 

Note that servers are not required to support AuditEvent and Provenance at all - clients must consult the 
server's CapabilityStatement to see if they provide this information.


# Server Obligations

Servers SHALL

* Implement the required resource types Patient, AllergyIntolerance, Condition, ?
 * note that this does not mean that a patient always has items, but that they server is able to return them if the patient requests that they be provided
* todo
