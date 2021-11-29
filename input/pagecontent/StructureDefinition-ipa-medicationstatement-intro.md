The MedicationStatement resource represents all medications a patient is taking, be it those ordered by a clinician or reported by another organization, the patient or a caregiver. 

### Medication Statement and Medication Request 

While the relationship between Medication Statement and Medication Request is clear in principle, 
in practice, when patients report medications, these may also be implicitly treated as statements of intent 
about what the patient should be taking. As such, information systems may record these statements 
as either Medication Requests or Medication Statements, or as both. The choice between these options 
may be influenced by many factors including wording in legislation and regulations.

For this reason, clients implementing the International Patient Access specification SHALL query for both 
MedicationStatement and MedicationRequest when fetching patient Medication information. 
