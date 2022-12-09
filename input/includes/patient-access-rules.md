During the [Authorization process](access.html), the user and the Authorization service fixes the patient record to a single individual patient. <span class="bg-success" markdown="1">For safety, client applications should specify the patient id when searching other resources.</span><!-- new-content --> 

The client application SHALL be capable of accessing the patient record using the following API call:

```GET [url]/Patient/[id]```

<!-- ```GET [url]/Patient?_id=[id]```

```GET [url]/Patient?identifier=[identifier]``` -->

<div class="bg-success" markdown="1">
The client application MAY use these search parameters that servers are required to support to access the patient record:

- [`_id`]({{site.data.fhir.path}}resource.html#search)
- [`identifier`]({{site.data.fhir.path}}patient.html#search)
</div><!-- new-content -->

Servers are not required to support any additional search parameters, and clients SHOULD NOT expect servers to do so.

<div class="bg-success" markdown="1">
Additional rules and guidance for supporting `Patient.link`: 

- The server:
    - SHALL have no more than one Patient with a status of active = "true" *from the server being queried* 
    - MAY include inactive patients on the *same server*
    - MAY include inactive or active patients from a *different server*
    - When returning a [search Bundle](http://hl7.org/fhir/bundle.html) that contains more than one Patient record for the same patient, the Patient record(s) SHALL use the `Patient.link` attribute to cross-link the Patient resources.
- The client:
    - SHALL be able to follow the link(s) to the other Patient resource(s) and understand the direction of the link (in other words, which Patient is linked to which other Patient)
    - SHALL understand the `Patient.link.type` code which defines the type of link between this Patient resource and another Patient resource
    - SHALL be aware of the linked Patient `active` flag and that inactive patients may have relevant information
</div><!-- new-content -->
