
Accessing Patient records raises many questions of safety. Both accessing the wrong patient records, 
or missing correct records, or displaying records incorrectly can create real harm to patients.

Note: this is still true even given the widely recognised chaotic state of healthcare records. 

Also note that it's also very serious if health care records are interpreted incorrectly by 
software, but this specification does not provide enough information about the records being 
accessed in order to support interpretation of the content. [Country specific guides](ipa-by-country.html) must be consulted for this.

This page gathers clinical safety advice acquired from experience of access health records across
FHIR APIs like this one. All implementers should carefully consider each of the items on the check list.

Note that getting these issues right is necessary but not sufficient for delivering safe patient applications.

# Client Safety Check list 

Clients should complete this check list, and are likely to be asked by servers to confirm that they have done so:

* The client [checks the patient resource to which access has been granted](fetching.html)
* the client etc
* merge
* operation outcomes / self link in search requests
* the client always checks the status on the resources...
* synchronization issues 
* information appearing in multiple places

# Server Safety Check List 

* etc
* xhtml
