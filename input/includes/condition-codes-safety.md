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