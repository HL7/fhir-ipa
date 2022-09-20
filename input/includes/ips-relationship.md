### Relationship between IPA and IPS 

The [International Patient Summary (IPS)](http://hl7.org/fhir/uv/ips) specifies a more extensive set of rules about the content that clinical systems may conform to.

* IPA (this specification): a specification for access to a patient record with minimal expectations about the content
* [IPS](http://hl7.org/fhir/uv/ips/): a specification that describes a package that contains a clinical summary for the patient

These specifications are doing different things - one is making provision for access to a record, and the other is 
making rules about the content found in the record. 

The specifications do overlap, in that some systems that are required conform to both specifications - that is:
* systems that are capable of producing a Patient Summary that meets the IPS rules, and 
* also provide access to the patient record as specified here 

Such systems will produce content that has two different sets of rules applied - the minimal expectations 
in this specification, and the more extensive rules specified in IPS. 

These rules are consistent; the content rules in this specification are a subset of the IPS content rules, 
and any system that meets the information requirements in IPS automatically conforms to the 
requirements on the content specified here. 

Note that not all systems that conform to IPS are required to provide direct patient access, though many will. 
Also, many systems that provide access to patient as described by this specification will not be able to conform IPS, but some will.

