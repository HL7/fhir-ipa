This profile describes how applications fetch Practitioner resources that provide information about other individuals that are involved in the care of the patient. 

### Example Usage Scenarios:

A patient's record is full of records of events or planned actions where the actors  are 
care practitioners of various kinds. Note that these include any person employed by a healthcare provider,
including clerical staff, orderlies, etc as well as the more obvious practitioners such as doctors and 
nurses. All these may be represented as a Practitioner resource.

Note that the Patient Access API provides access to both Practitioner and [PractitionerRole](StructureDefinition-ipa-practitionerrole.html) resources.
The difference in underlying record keeping that leads to this choice is not of interest to clients
that access patient records, but they can expect to encounter both types of resource.

All servers SHALL provide an API to access Practitioner resources as described here. 
Note that servers are allowed to provide some practitioner records as contained resources, but 
SHOULD avoid doing so where ever possible. 

Clients access practitioner resources using this call:

```GET [url]/Practitioner/[id]```

where id is found in some other resource that refers to a Practitioner. The result of this request is 
a Practitioner resource, or an error if there is no resource the client can access for that id. 

The Practitioner SHALL have:

* an active flag
* a name

Note that in some cases, the actual name of the practitioner is not made available. In such cases,
the server SHALL provider some human-useful text in [HumanName.text](http://hl7.org/fhir/R4/datatypes-definitions.html#HumanName.text)
that the client can use. 

Servers may choose to provide additional information, or may be required to do so by national or other additional 
profiles on practitioner that apply in the servers context.

#### Search

Servers are not required to support search functionality on Practitioner, but may do so. If they do, the 
search SHALL be limited to Practitioner resources that relate to the patient in scope. Typical search
parameters a Server could choose to support would be ```name``` and ```active```
