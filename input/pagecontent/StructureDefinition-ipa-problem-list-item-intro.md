
### Mandatory and Must Support Data Elements

<div class="bg-success" markdown="1">
<!-- Boilerplate -->
The following data elements must always be present (in other words, mandatory resource properties with a minimum cardinality of 1) or must be supported ([Must Support](conformance.html#must-support) definition). Servers cannot restrict access to mandatory elements when authorizing an application. However, servers may choose to provide additional information or may be required to do so by national or other profiles that apply to the server's context.

**Each Condition SHALL have:**
* a code identifying the condition, problem, or diagnosis
* a patient
* at least a category code of "problem-list-item"
 
**Applications must also support:**
* a clinical status
* a verification status

</div><!-- new-content -->

<!-- (only if present) -->
### Profile Specific Implementation Rules and Guidance

#### Retrieving the Current Problem List:

The current problem list is retrieved by specifying the patient, category and  clinical-status:

```GET [url]/Condition?patient=[patient-id]&category=problem-list-item&clinical-status=active```

{% include condition-codes-safety.md %}

<!--{%raw%}{% include patient-access-rules.md %}{%endraw%}-->

<!-- (and only if present) -->
<!-- ### Example Usage Scenarios -->

<!-- include content or add inline -->

