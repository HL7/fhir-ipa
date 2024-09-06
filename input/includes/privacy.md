This specification depends on [Smart App Launch](http://hl7.org/fhir/smart-app-launch) which profiles an OAuth 2.0 authorization process,
such that the user decides what access to grant to the application that they are using. 

The application asks for the access it requires based on [SMART App Launch Patient Scopes](http://hl7.org/fhir/smart-app-launch/scopes-and-launch-context.html#patient-specific-scopes), either when the OAuth process is initiated, 
or when the application is registered. Other additional information may be collected during whatever registration process applies 
for the application. 

Once a client launches the OAuth process, the Authorization server considers rules such as:

* Applicable laws and regulations
* Institutional policies and agreements 
* Existing Patient consent agreements
* Application access request 

Once the authorization server has determined what information the user has a right to 
access, it prompts the user to choose a subset of that 
the information they wish to share with the client application.

The Authorization server then returns a set of scopes to the application that describes what access
the user has authorized. Clients need to be aware that the Authorization server cannot fully describe 
the access rules in the scopes and SHALL be prepared to handle failure gracefully. 


- Servers are not required to support search functionality on Practitioner. If they do, it's important to balance the privacy of healthcare workers with the patient's access to information. Only information about the practitioners that relate to the patient is relevant.

- Servers MAY choose to inform a client when information is not available, but most servers will simply 
behave as if it doesn't exist (see [note in FHIR specification](http://hl7.org/fhir/security.html#AccessDenied)).

- This specification labels some elements as [must-support](conformance.html#must-support-and-obligations). This 
does not override the patient's right to decide whether to authorize an application to access their information.



