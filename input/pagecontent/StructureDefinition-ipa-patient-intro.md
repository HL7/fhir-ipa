
### Mandatory and Must Support Data Elements

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


### Profile Specific Implementation Rules and Guidance

{% include patient-access-rules.md %}
