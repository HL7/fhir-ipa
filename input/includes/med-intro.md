### Medication Statement and Medication Request 

While the relationship between Medication Statement and Medication Request is clear in principle, 
in practice, when patients report medications, these may also be implicitly treated as statements of intent 
about what the patient should be taking. As such, information systems may record these statements 
as either Medication Requests or Medication Statements, or as both. The choice between these options 
may be influenced by many factors including wording in legislation and regulations.

For this reason, clients implementing the International Patient Access specification SHALL query for both 
MedicationStatement and MedicationRequest when fetching patient Medication information.

As noted there is currently no consensus how a patient can access their active, historical and future (planned) medications list. Feedback is welcome on what additional guidance can be given to promote more international alignment.
{:.stu-note}

### Medication specificity

When representing a prescribed medication, servers SHOULD use codings at the level of a clinical drug rather than ingredient or dose form (e.g. “loratadine 10mg oral tablet”, rather than a bare ingredient like “loratadine” or a dose form like “loratadine oral tablet”).