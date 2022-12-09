#### Medication Statement and Medication Request 

While the relationship between Medication Statement and Medication Request is clear in principle, 
in practice, when patients report medications, these may also be implicitly treated as statements of intent 
about what the patient should be taking. As such, information systems may record these statements 
as either Medication Requests or Medication Statements, or as both. The choice between these options 
may be influenced by many factors including wording in legislation and regulations.

For this reason, clients implementing the International Patient Access specification SHALL query for both 
MedicationStatement and MedicationRequest when fetching patient Medication information.

As noted there is currently no consensus how a patient can access their active, historical and future (planned) medications list. Feedback is welcome on what additional guidance can be given to promote more international alignment.
{:.stu-note}

#### Fetching Medications

The MedicationRequest and MedicationStatement resources can represent a medication using either
a code or refer to the Medication resource. When referencing Medication, the
resource may be [contained]({{site.data.fhir.path}}references.html#contained)
or an external resource. The server application **MAY** choose any one way or
more than one method, but if an external reference to Medication is used, the
server **SHALL** support the `_include` parameter for searching this element.
The client application **SHALL** support all methods. For example, A server
**SHALL** be capable of returning all medications for a patient using one of
or both:

  `GET /MedicationStatement?patient=[id]`

  `GET/MedicationStatement?patient=[id]&_include=MedicationStatement:medication`

{% if include.medrequest %}
#### Medication specificity

When representing a prescribed medication, servers SHOULD use codings at the level of a clinical drug rather than ingredient or dose form (e.g. “loratadine 10mg oral tablet”, rather than a bare ingredient like “loratadine” or a dose form like “loratadine oral tablet”).
{% endif %}

