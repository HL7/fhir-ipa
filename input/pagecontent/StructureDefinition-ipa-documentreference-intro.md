
### Mandatory and Must Support Data Elements


<!-- Boilerplate -->
The following data elements must always be present (in other words, mandatory resource properties with a minimum cardinality of 1) or must be supported ([Must Support](conformance.html#must-support) definition). Servers cannot restrict access to mandatory elements when authorizing an application. However, servers may choose to provide additional information or may be required to do so by national or other profiles that apply to the server's context.


**Each Immunization SHALL have:**
* a status
* a patient
* one or more documents referenced (content) which is either a URL where the data can be found or inline data or both
* the MIME type (i.e. contentType) of the document
  
**Applications must also support:**
* a code describing the type of document
* one or more category codes used to group document types
* date and time the reference was created
* one or more authors
* a code identifying the specific details about the format of the document — over and above the content’s MIME type
* the patient encounter that is being referenced
* clinically relevant date


<!-- (only if present) -->
<!-- ### Profile Specific Implementation Rules and Guidance -->

<!-- include content or add inline -->

<!--{%raw%}{% include patient-access-rules.md %}{%endraw%}-->

<!-- (and only if present) -->
<!-- ### Example Usage Scenarios -->

<!-- include content or add inline -->

