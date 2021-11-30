This specification depends on [Smart App Launch](http://hl7.org/fhir/smart-app-launch) which profiles an OAuth 2.0 authorization process,
such that the user decides what access to grant to the application that they are using. 

The application asks for the access it requires based on [SMART App Launch Patient Scopes](http://hl7.org/fhir/smart-app-launch/scopes-and-launch-context.html#patient-specific-scopes), either when the OAuth process is initiated, 
or when the application is registered. Other additional information may be collected during whatever registration process applies 
for the application. 

Once the OAuth process is launched, the Authorization server considers rules such as:

* Applicable laws and regulations
* Institutional policies and agreements 
* Existing Patient consent agreements
* Application access request 

Once the server has determined what information the user has a right to access, then it asks the user to 
additionally choose what subset of that information they wish to share with the client
application. 

The Authorization server then returns a set of scopes to the application that describe what access
the user has authorised. Clients need to be aware that the Authorization server cannot fully describe 
the full set of access rules in the scopes, and SHALL be prepared to handle failure gracefully. 

Servers MAY choose to inform a client when information is not available, but most servers will simply 
behave as if it doesn't exist (see [note in FHIR specification](http://hl7.org/fhir/security.html#AccessDenied)).

Note that this specification labels some elements as [must-support](conformance.html#must-support). This 
does not override the patient's right to decide whether to authorize an application to access their information.
