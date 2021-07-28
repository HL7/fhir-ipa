Many applications that use this API to access patient records keep a synchronized copy of the patient record elsewhere.

In order to make this a safe process, application developers should code defensively. Notably, there's a few surprising reasons why previously accessible resources may no longer be returned by a FHIR server:

* Not all FHIR servers preserve resource ids – all systems SHOULD, for all sorts of reasons, but not all systems do. Those that don’t: the consequence is that there’s no way for any application to maintain a copy of the information downstream.
* Similarly, some systems may permit the hard-deletion of a resource (record) from the origin server, making it unavailable from the API.
* The record was marked as confidential on the server side, and policy is not to provide access to confidential information across the API.
* The record was created against the wrong subject, and that’s been fixed by simply changing the subject. The resource is no longer available for this patient.
* The portal providing the API service may have lost access to the underlying record store.
* The record may no longer be available to the production system if enough years (5-7 or longer) have passed.
* Patient records may be merged or unmerged. Different systems may handle this slightly differently.

Applications should note that there are challenges around synchronizing records - see a [Hard FHIR Safety Problem: Synchronization](http://www.healthintersections.com.au/?p=2950) for additional considerations and analysis on the above and other synchronization challenges.
