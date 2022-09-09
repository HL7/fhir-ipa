Note that the base FHIR specification defines a profile on the Observation resource used to specifically represent vitals signs. To adhere to IPA as well as the base FHIR specifications, implementers SHALL support the [FHIR Core Vitals Signs profile](http://hl7.org/fhir/us/core/2017Jan/StructureDefinition-us-core-vitalsigns.html). 

The IPA-Observation profile defined here SHALL be used to represent Observations other than vital signs such as:

<div class="bg-success" markdown="1">
- Laboratory data (for example, blood glucose)
- Imaging or clinical test results (for example, bone density or electrocardiogram (ECG))
- Social history (for example, tobacco use or occupation data<sup>1</sup>)
- General health status (for example, pregnancy status)
</div><!-- new-content -->