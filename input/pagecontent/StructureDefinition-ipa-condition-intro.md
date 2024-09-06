
### Mandatory and Must Support Data Elements


<!-- Boilerplate -->
The following data elements must always be present (in other words, mandatory resource properties where the minimum cardinality is 1) or must be supported ([Must Support](conformance.html#must-support-and-obligations) definition). Servers cannot restrict access to mandatory elements when authorizing an application. However, servers may choose to provide additional information or may be required to do so by national or other profiles that apply to the server's context.

**Each Condition SHALL have:**
* a code identifying the condition, problem, or diagnosis
* a patient
 
**Applications must also support:**
* a clinical status
* a verification status
* one or more category codes used to group conditions


<!-- (only if present) -->
### Profile Specific Implementation Rules and Guidance

#### Accessing Condition Resources 

Clients can access a Condition resources using:

```GET [url]/Condition/[id]```

where id is found in some other resource that refers to a Condition. The result of this read is 
a Condition resource, or an error if there is no resource the client can access for that id. 
Alternatively, the client may search for condition resources.

{% include condition-codes-safety.md %}

<!-- (and only if present) -->
<!-- ### Example Usage Scenarios -->

<!-- include content or add inline -->

