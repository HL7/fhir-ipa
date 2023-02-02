Many applications that access patient records keep a synchronized copy of the patient record elsewhere.

To make this a safe process, application developers should code defensively. Notably, there are a few surprising reasons why a FHIR server may no longer return previously accessible resources:

* Not all FHIR servers preserve FHIR resource ids – all systems SHOULD, for all sorts of reasons, but not all systems do. Consequently, applications cannot maintain a copy of the downstream information.
* Similarly, some systems may permit the hard deletion of a resource (a record) from the origin server, making it unavailable from the API.
* The record was marked as "confidential" on the server side, and the policy is not to provide access to confidential information across the API.
* The record was created for the wrong subject and subsequently corrected. Therefore resource is no longer available for the original patient.
* The API service portal may have lost access to the underlying record store.
* The record may no longer be available to the production system if enough years (e.g., 5-7 years or longer) have passed.
* Patient records may be merged or unmerged. Different systems handle this differently.

Applications should note that there are challenges around synchronizing records - see a [Hard FHIR Safety Problem: Synchronization](http://www.healthintersections.com.au/?p=2950) for additional considerations and analysis on the above and other synchronization challenges.
