

###  Release 1.0.1
- Expected Publication date: 2024-09-21
- Expected Publication status: STU
- Based on FHIR version: 4.0.1

This change log documents the changes from version 1.0.0 to 1.0.1. Primarily, release 1.0.1 adopts the HL7 FHIR Obligations framework as an enhancement to FHIR's Must Support concept as well as formally defining two actors: IPA Server and IPA Client. 
Adhering to release 1.0.0's narrative definition of Must Support, release 1.0.1 generally (although not exlusively) applied the the SHALL populate-if-known obligation to the server for MS elements, and the SHALL handle obligation to the client. 
Exceptions to this approach are noted below. A more complete, technical diff of changes is available here: https://github.com/HL7/fhir-ipa/pull/110/files.

Additional, significant changes made in this update are documented, below -- 

#### Changes in this version
- Made the following changes to IPA AllergyIntolerance:
  - Clarified that AllergyIntolerance.category is not MustSupport by removing contradictory narrative. (https://jira.hl7.org/browse/FHIR-46746)
- Made the following changes to IPA DocumentReference:
  - Broadened permitted target references of DocumentReference.author to align with base FHIR R4. (https://jira.hl7.org/browse/FHIR-44562)
- Made the following changes to IPA Immunization:
  - Clarified that Immunization.statusReason is not MustSupport by removing contradictory narrative. (https://jira.hl7.org/browse/FHIR-46743)
- Made the following changes to IPA MedicationRequest:
  - Broadened permitted target references of MedicationRequest.requestor to align with base FHIR R4. (https://jira.hl7.org/browse/FHIR-44563)
- Made the following changes to IPA MedicationStatement:
  - Added a call to implementers for feedback on removing MustSupport from MedicationStatement.statusReason.
- MustSupport -> Obligation deviations
  - This release changes Patient.identifier's MustSupport Obligation to "SHALL: explain", which deviates from the previous default, narrative definition of MustSupport.
  - Removed the default MustSupport requirement for the Client actor from the following elements: AllergyUIntolerance.patient, Condition.category, Condition.subject, DocumentReference.date, MedicatioNRequest.intent, MedicationRequest.encounter, MedicationRequest.authoredOn, MedicationStatement.context, Patient.identifier.value, patient.active, patient.name, Practitioner.name, PractitionerRole.practitioner.
  - Changed MedicationRequest.doNotPerform MustSupport requirement on the Server from the narrative definition of MustSupport which was equivalent to populate-if-known, to the stricter populate obligation.

 
### Release 1.0.0
- Publication date: 2023-03-26	
- Publication status: STU
- Based on FHIR version: 4.0.1

Release 1.0.0 was the first trial use publication of the HL7 IPA IG, towards a goal of helping patients access their data through universal realm FHIR APIs and SMART (OAuth 2.0) security mechanisms useable in any region in the world. IPA implementers are encouraged to re-use IPA profiles and support additional SMART App Launch capabilities, such as the “Clinician Access for EHR Launch” scenario or “Backend Services”.
