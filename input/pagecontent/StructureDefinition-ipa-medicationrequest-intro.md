
### Mandatory and Must Support Data Elements


<!-- Boilerplate -->
The following data elements must always be present (in other words, mandatory resource properties with a minimum cardinality of 1) or must be supported ([Must Support](conformance.html#must-support) definition). Servers cannot restrict access to mandatory elements when authorizing an application. However, servers may choose to provide additional information or may be required to do so by national or other profiles that apply to the server's context.


**Each MedicationRequest SHALL have:**
* a status
* a code to indicate wether the request is a proposal, plan, or an original order
* a medication*
* a patient
  
\* see guidance below
 
**Applications must also support:**
* the reported flag or reference signaling that information is from a secondary source such as a patient
* the encounter
* a date for when written
* the prescriber/requester 
* the prescription Sig


<!-- (only if present) -->
### Profile Specific Implementation Rules and Guidance

<!-- include content or add inline -->

{% include med-guidance.md medrequest=true %}

<!-- (and only if present) -->
<!-- ### Example Usage Scenarios -->

<!-- include content or add inline -->

