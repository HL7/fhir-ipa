### Relationship between IPA and IPS 

<div class="bg-success" markdown="1">
The [International Patient Summary (IPS)](http://hl7.org/fhir/uv/ips) specifies
a more extensive set of rules about the content that clinical systems may
conform to.

* IPA (this specification): a specification for access to a patient record with
minimal expectations about the content
* [IPS](http://hl7.org/fhir/uv/ips/): a specification that describes a package
that contains a clinical summary for the patient

These specifications are doing different things - one is making provision for
access to a record, and the other is making rules about the content found in the
record. However, because the content rules in this specification are a subset of
the IPS content rules,  any system that meets the information requirements in
IPS automatically conforms to IPA and can also provide access to the patient
record as specified in IPA.
</div><!-- new-content -->



