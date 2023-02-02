
### Mandatory and Must Support Data Elements


<!-- Boilerplate -->
The following data elements must always be present (in other words, mandatory resource properties with a minimum cardinality of 1) or must be supported ([Must Support](conformance.html#must-support) definition). Servers cannot restrict access to mandatory elements when authorizing an application. However, servers may choose to provide additional information or may be required to do so by national or other profiles that apply to the server's context.


**Each AllergyIntolerance SHALL have:**
* a code that identifies the allergy or intolerance
* a patient
  
**Applications must also support:**
* a clinical status
* a verification status
* one or more category codes used to group allergies


<!-- (only if present) -->
<!-- ### Profile Specific Implementation Rules and Guidance -->

<!-- include content or add inline -->

<!--{%raw%}{% include patient-access-rules.md %}{%endraw%}-->

<!-- (and only if present) -->
<!-- ### Example Usage Scenarios -->

<!-- include content or add inline -->

