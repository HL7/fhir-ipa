This profile describes how applications fetch Condition resources that provide information about a patient's problems. 

### Example Usage Scenarios:

The most important and obvious use of the condition to resource is to get a list of the patient's 
current problem list. However there are many other uses for the condition resource, such as 
recording primary and secondary diagnoses for encounters, or justification for past medications
etc. 

All servers SHALL provide an API to access Condition Resources as described here. 

Clients access Condition resources using one of these two calls:

```GET [url]/Condition/[id]```

where id is found in some other resource that refers to a Condition. The result of this read is 
a Condition resource, or an error if there is no resource the client can access for that id. 
Alternatively, the client may search for condition resources.

The current problem list is retrieved by specifying the patient, category and and clinical-status:

```GET [url]/Condition?patient=[patient-id]&category=problem-list-item&clinical-status=active```

Regardless of which way they are accessed, all Condition resources have to conform to the following rules:

* They SHOULD have a ```clinicalStatus```
* They SHOULD have a ```verificationStatus```
* They SHALL have at least one category
* They SHALL have a code 
* They SHALL have a subject

Servers may choose to provide additional information, or may be required to do so by national or other additional 
profiles on conditions that apply in the servers context. 

### Condition Codes

All Condition resources are required to have a code, but the coding systems used around the world 
and even within jurisdictions very wildly. This specification does not fix any kind of value set that 
controls what kind of codes can be used - other national specifications etc will place their own 
restrictions on the codes. 

Client Applications should be prepared to encounter codes they do not recognise and handle the records 
accordingly. Servers SHOULD populate Condition.code.coding.display and/or Condition.code.text so that 
clients can always at least display the condition even if they do not know the codes that are used.

Clients should be careful making use of the ```code``` search parameter given that the codes used
vary so much.

### Safety Issues

* Clients SHALL not treat all conditions as if they are part of the patient's current problem list
    * Note that some Condition resources may not have these status codes - this is usually due to poor record keeping reflected in legacy data
    * Servers SHOULD avoid leaving these status codes missing
* Clients SHALL pay attention to the ```clinicalStatus``` and ```verificationStatus``` and display and process them correctly
* Clients SHALL still work safely when the server does not support all the search parameters listed above (see [Search advice](safety.html))
