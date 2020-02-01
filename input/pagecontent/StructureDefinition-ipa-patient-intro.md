This profile describes how applications fetch the Patient resource to check the patient identity and access basic demographics and other administrative information about the patient. 

### Example Usage Scenarios:

The patient record is fixed to a single individual patient by the user and the Authorization service record during
the [Authorization process](access.html). The client application can access the patient 
record using the following API call:

```GET [url]/Patient```

Servers are not required to support any additional search parameters, and clients SHOULD not expect servers to do so.

This [search](http://hl7.org/fhir/http.html#search) SHALL return a [Bundle](http://hl7.org/fhir/bundle.html) that contains one or more Patient
records that all concern the same same patient. If more than one resource is returned, the Patient records SHALL use the Patient.link attribute
to cross link the records, and there SHALL only be one Patient record with active = true. 

Each Patient SHALL have:

* an active flag
* a patient identifier (e.g. MRN)
* a patient name
* an administrative gender (note: this is for administrative purposes; see [note about Patient Gender and Sex for discussion](http://hl7.org/fhir/patient.html#gender))

Note that this implies that the user cannot restrict access to these properties when authorizing the application.

Applications [must also support](conformance.html):

* Birth date
* Patient Links

Servers may choose to provide additional information, or may be required to do so by national or other additional profiles on patient that apply in the servers context.

