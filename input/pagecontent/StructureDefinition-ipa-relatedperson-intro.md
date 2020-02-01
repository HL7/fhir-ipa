This profile describes how applications fetch RelatedPerson resources that provide information about other individuals that are involved in the care of the patient. 

## Example Usage Scenarios:

A patient's record is full of records of events or planned actions where the actor of various kinds (informer, carer, etc) 
is a person related to the patient somehow who is not a care provider. Typically these are parents or other family, or 
guardians of some kinds, but the kind of relationship is not restricted. Clients that retrieve patient records will
find references to these related persons, and a Patient Access SHALL make it possible for a client to access 
these resources.

These resources may be inlined as contained resources - this is not unusual for RelatedPerson records, where 
the source systems do not keep identifying information, and often has either name or role (or sometimes both). 
If a server only uses contained resources for such resources, it need not support this API. 

If, however, the server does keep identifying records for such related parties, the server SHOULD NOT use 
contained resources, as data analytics is much more useful on identified records. When a server does not use 
contained RelatedPerson resources, it SHALL support this API.

Clients access related person records using this call:

```GET [url]/RelatedPerson/[id]```

where id is found in some other resource that refers to a RelatedPerson. The result of this search is 
a RelatedPerson resource, or an error there is no resource the client can access for that id. 

The RelatedPerson SHALL have either:

* a name
* a code for the type of relationship (e.g. 'mother')

If a code is present, it SHOULD have a text value for easy display by a client that does not understand the 
codes used for relationship (which can be highly variable across systems).

Servers may choose to provide additional information, or may be required to do so by national or other additional 
profiles on patient that apply in the servers context.

### Search

Servers are not required to support search functionality on RelatedPerson, but may do so. If they do, the 
search SHALL be limited to RelatedPerson resources that relate to the patient in scope. Typical search
parameters a Server could choose to support would be ```name``` and ```relationship```
