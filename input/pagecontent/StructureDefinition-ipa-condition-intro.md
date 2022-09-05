<div class="bg-success" markdown="1">
This profile communicates information about a patient's condition or diagnosis, such as recording primary and secondary diagnoses for encounters or justification for past medications. For use of the condition resource to get a list of the patient's current problem list, use the [IPA-Problem-List-Item](StructureDefinition-ipa-problem-list-item.html) profile instead. The difference between this profile and the IPA Problem List Item profile is that this profile does not specify or require a category.

#### Accessing Condition Resources 

Clients can access a Condition resources using:

```GET [url]/Condition/[id]```

where id is found in some other resource that refers to a Condition. The result of this read is 
a Condition resource, or an error if there is no resource the client can access for that id. 
Alternatively, the client may search for condition resources.

Regardless of which way they are accessed, all Condition resources have to conform to the following rules:

* They SHOULD have a ```clinicalStatus```
* They SHOULD have a ```verificationStatus```
* They SHALL have at least one category
* They SHALL have a code 
* They SHALL have a subject

Servers may choose to provide additional information, or may be required to do so by national or other additional 
profiles on conditions that apply in the servers context.
</div><!-- new-content --> 

{% include condition-codes-safety.md %}
