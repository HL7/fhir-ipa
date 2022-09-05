<div class="bg-success" markdown="1">
The most important and prominent use of the condition resource is to get a list of the patient's current problem list. This Condition profile communicates information about a patient's problems. For other uses for the Condition resource, such as recording primary and secondary diagnoses for encounters or justification for past medications, use the [IPA-Condition](StructureDefinition-ipa-condition.html) profile instead. The difference between this profile and the IPA Condition profile is that this profile requires a mandatory category of "problem-list-item".

### Retrieving the Current Problem List:

The current problem list is retrieved by specifying the patient, category and  clinical-status:

```GET [url]/Condition?patient=[patient-id]&category=problem-list-item&clinical-status=active```

All Condition resources have to conform to the following rules:

* They SHOULD have a ```clinicalStatus```
* They SHOULD have a ```verificationStatus```
* They SHALL have a category of "problem-list-item"
* They SHALL have a code 
* They SHALL have a subject

Servers may choose to provide additional information, or may be required to do so by national or other additional 
profiles on conditions that apply in the servers context. 
</div><!-- new-content -->

{% include condition-codes-safety.md %}