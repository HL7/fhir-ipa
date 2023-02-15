
### Mandatory and Must Support Data Elements


<!-- Boilerplate -->
The following data elements must always be present (in other words, mandatory resource properties with a minimum cardinality of 1) or must be supported ([Must Support](conformance.html#must-support) definition). Servers cannot restrict access to mandatory elements when authorizing an application. However, servers may choose to provide additional information or may be required to do so by national or other profiles that apply to the server's context.


**Each Patient SHALL have:**

* a patient identifier (e.g. MRN)
* a patient name
  
**Applications must also support:**

* an administrative gender (note: this is for administrative purposes; see [note about Patient Gender and Sex for discussion](http://hl7.org/fhir/patient.html#gender))
* an active flag (It SHALL be present if patients links are present)*
* Birth date
* Patient Link*

\* See guidance below

<!-- (only if present) -->
### Profile Specific Implementation Rules and Guidance

<!-- include content or add inline -->

<!--{%raw%}{% include patient-access-rules.md %} {%endraw%}-->
{% include patient-access-rules.md %}

<!-- (and only if present) -->
<!-- ### Example Usage Scenarios -->

<!-- include content or add inline -->

