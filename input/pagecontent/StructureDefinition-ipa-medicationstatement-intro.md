{% raw %}
<blockquote class="stu-note">
<p>
We are proposing to removing MS from stautsReason. Implementer feedback is encouraged.
</p>
</blockquote>
{% endraw %}

### Mandatory and Must Support Data Elements


<!-- Boilerplate -->
The following data elements must always be present (in other words, mandatory resource properties where the minimum cardinality is 1) or must be supported ([Must Support](conformance.html#must-support) definition). Servers cannot restrict access to mandatory elements when authorizing an application. However, servers may choose to provide additional information or may be required to do so by national or other profiles that apply to the server's context.


**Each MedicationStatement SHALL have:**
* a status
* a medication*
* a patient
  
\* see guidance below
 
**Applications must also support:**
* a status reason
* the encounter/episode of care
* the date/time or interval when the medication is/was/will be taken
* person or organization that provided the information
* the prescription Sig


<!-- (only if present) -->
### Profile Specific Implementation Rules and Guidance

<!-- include content or add inline -->

{% include med-guidance.md medrequest=false %}

<!-- (and only if present) -->
<!-- ### Example Usage Scenarios -->

<!-- include content or add inline -->

</body>