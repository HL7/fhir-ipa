
### Mandatory and Must Support Data Elements


<!-- Boilerplate -->
The following data elements must always be present (in other words, mandatory resource properties where the minimum cardinality is 1) or must be supported ([Must Support](conformance.html#must-support) definition). Servers cannot restrict access to mandatory elements when authorizing an application. However, servers may choose to provide additional information or may be required to do so by national or other profiles that apply to the server's context.


**Each Observation SHALL have:**
* a status
* a code identifying the type of observation
* a person
 
**Applications must also support:**
* one or more category codes used to group observations
* clinically relevant time/time-period for the observation
* the observation result value
* a reason why the result value is missing

<!-- (only if present) -->
### Profile Specific Implementation Rules and Guidance

<!-- include content or add inline -->

Note that the base FHIR specification defines a profile on the Observation resource used to specifically represent vitals signs. To adhere to IPA as well as the base FHIR specifications, implementers SHALL support the [FHIR Core Vitals Signs profile](http://hl7.org/fhir/us/core/2017Jan/StructureDefinition-us-core-vitalsigns.html). 

The IPA-Observation profile defined here SHALL be used to represent Observations other than vital signs such as:


- Laboratory data (for example, blood glucose)
- Imaging or clinical test results (for example, bone density or electrocardiogram (ECG))
- Social history (for example, tobacco use or occupation data<sup>1</sup>)
- General health status (for example, pregnancy status)


<!-- (and only if present) -->
<!-- ### Example Usage Scenarios -->

<!-- include content or add inline -->

