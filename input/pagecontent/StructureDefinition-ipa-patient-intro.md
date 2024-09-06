
### Mandatory and Must Support Data Elements


<!-- Boilerplate -->
The following data elements must always be present (in other words, mandatory resource properties where the minimum cardinality is 1) or must be supported ([Must Support](conformance.html#must-support-and-obligations) definition). Servers cannot restrict access to mandatory elements when authorizing an application. However, servers may choose to provide additional information or may be required to do so by national or other profiles that apply to the server's context.

{% raw %}
<blockquote class="stu-note">
<p>
This specification is currently published as a Standard for Trial Use (STU).  Feedback is welcome and may be submitted through the <a href="http://hl7.org/fhir-issues">FHIR change tracker</a> indicating "International Patient Access (FHIR)" as the specification. The publishers of the specification are seeking feedback on two elements in this Patient profile.
</p>
<p>
<ol>
<li>
Currently, the Patient.identifier element is identified as mandatory. The intent is that all servers must provide a unique patient identifier that can facilitate a federated approach to accessing patient information. Please provide any evidence for or against this decision.
</li>
<li>In the balloted version of this specification, the Patient.name element was identified as mandatory (meaning minimal cardinality of 1) and provided a rule that the use of the  <a href="https://hl7.org/fhir/R4/extension-data-absent-reason.html">Data Absent Reason (DAR) extension</a> was allowed. In this published version, Patient.name is not mandatory. It was expressed that having the minimal cardinality of 1 may not enable privacy preserving mechanisms, such as patients limiting client application access to their demographic information, including name, as part of the authorization process. Implementer feedback is requested on whether Patient.name should be a mandatory element.
</li>
</ol>
</p>
</blockquote>
{% endraw %}

**Each Patient SHALL have:**

* a patient identifier (e.g. MRN)

**Applications must also support:**

* a patient name
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

