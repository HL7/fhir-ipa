
Accessing Patient records raises many questions about safety. Accessing the wrong patient records, missing correct records, displaying records incorrectly, or having non-authorized actors access records can potentially harm patients. The [Implementer Safety Checklist page]({{site.data.fhir.path}}safety.html) gathers clinical safety advice acquired from experience of accessing health records across
FHIR APIs like this one. All implementers should carefully consider each of the items on the checklist. Getting these issues right is necessary, but more is needed to deliver safe patient applications.

Note that software can misinterpret health care records, potentially leading to dire consequences. However, this specification does not provide enough information about accessing records to support interpreting the content. Implementers must consult their country-specific guides for this.

#### Patient matching
When [synchronizing](synchronization.html) a patient record, it's important to match not just a pre-existing patient identifier but also patient demographics. Additional care should be taken for patient merge and un-merge scenarios.


