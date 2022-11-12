During the [Authorization process](access.html), the user and the Authorization service fixes the patient record to a single individual patient. <span class="bg-success" markdown="1">For safety, client applications should specify the patient id when searching other resources.</span><!-- new-content --> 

<div class="bg-success" markdown="1">
Servers SHALL support and client applications SHALL be able to access
the patient record using all of the following API calls:

```GET [url]/Patient/[id]```

```GET [url]/Patient?_id=[id]```

```GET [url]/Patient?identifier=[identifier]```

Servers are not required to support any additional search parameters,
and clients SHOULD not expect servers to do so.

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
