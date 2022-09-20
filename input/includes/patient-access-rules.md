The patient record is fixed to a single individual patient by the user and the Authorization service record during
the [Authorization process](access.html). <span class="bg-success" markdown="1">Servers SHALL support and</span><!-- new-content --> Client applications can access the patient 
record using the following API call:

```GET [url]/Patient```

Servers are not required to support any additional search parameters, and clients SHOULD not expect servers to do so.

<div class="bg-success" markdown="1">

This [search](http://hl7.org/fhir/http.html#search) SHALL return a [Bundle](http://hl7.org/fhir/bundle.html) that contains one or more Patient
records that all concern the same patient. If more than one resource is returned, the Patient record(s) SHALL use the `Patient.link` attribute
to cross-link the Patient resources.

#### Additional rules and guidance for supporting  `Patient.link`: 

The server:

- SHALL have no more than one Patient with a status of active = "true" *from the server being queried* 
- MAY include inactive patients on the *same server*
- MAY include inactive or active patients from a *different server*


The client SHALL be capable of:

- following the link(s) to the other Patient resource(s)
- understand the direction of the link (in other words, which Patient is linked to which other Patient)
- understand the `Patient.link.type` code which defines the type of link between this Patient resource and another Patient resource
- be aware of the linked Patient `active` flag and that inactive patients may have relevant information.

</div><!-- new-content -->