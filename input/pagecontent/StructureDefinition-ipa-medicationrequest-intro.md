The MedicationRequest resource represents an order or request for both supply of the medication and the instructions for administration of the medication to a patient. 

### Medication Statement and Medication Request 

While the relationship between Medication Statement and Medication Request is clear in principle, 
in practice, when patients report medications, these may also be implicitly treated as statements of intent 
about what the patient should be taking. As such, information systems may record these statements 
as either Medication Requests or Medication Statements, or as both. The choice between these options 
may be influenced by many factors including wording in legislation and regulations.

For this reason, clients implementing the International Patient Access specification SHALL query for both 
MedicationStatement and MedicationRequest when fetching patient Medication information. 
