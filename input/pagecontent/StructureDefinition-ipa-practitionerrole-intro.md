This profile describes how applications fetch PractitionerRole resources that provide information about other individuals that are involved in the care of the patient. 

### Example Usage Scenarios:

A patient's record is full of records of events or planned actions where the actors are 
care practitioners of various kinds. Note that these include any person employed by a healthcare provider,
including clerical staff, orderlies, etc as well as the more obvious practitioners such as doctors and 
nurses. All these may be represented as a PractitionerRole resource.

Note that the Patient Access API provides access to both [Practitioner](StructureDefinition-ipa-practitioner.html) and PractitionerRole resources.
The difference in underlying record keeping that leads to this choice is not of interest to clients
that access patient records, but they can expect to encounter both types of resource.

All servers SHALL provide an API to access PractitionerRole Resources as described here. 
Note that servers are allowed to provide some practitioner role records as contained resources, but 
SHOULD avoid doing so where ever possible. 

Clients access PractitionerRole resources using this call:

```GET [url]/PractitionerRole/[id]```

where id is found in some other resource that refers to a PractitionerRole. The result of this request is 
a PractitionerRole resource, or an error if there is no resource the client can access for that id. 

The PractitionerRole SHALL have:

* an active flag
* a practitioner reference (which is an [IPA Practitioner](StructureDefinition-ipa-practitioner.html))

Servers may choose to provide additional information, or may be required to do so by national or other additional 
profiles on practitionerrole that apply in the servers context. The ```role``` property is often required by such
profiles.

#### Search

Servers are not required to support search functionality on PractitionerRole, but may do so. If they do, the 
search SHALL be limited to Practitioner resources that relate to the patient in scope. Typical search
parameters a Server could choose to support would be ```role``` and ```active```
