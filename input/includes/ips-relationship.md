### Relationship between IPA and IPS 


The [International Patient Summary (IPS)](http://hl7.org/fhir/uv/ips) specifies
a more extensive set of rules about the content that clinical systems may
conform to.

* IPA (this specification): a specification for access to a patient record with
minimal expectations about the content
* [IPS](http://hl7.org/fhir/uv/ips/): a specification that describes a document containing a clinical summary for a patient

These specifications are doing different things - one is making provision for
RESTful access to a record using modern authorization standards; the other is 
making rules about the content found in a summary of the record. Although some
considerations are appropriately given to these distinct use-cases, the content 
rules in this specification are generally a subset of the IPS content rules, 
systems that meet the information requirements in IPS will typically conform 
to IPA and can also provide access to the patient record as specified in IPA.




