A patient's record may contain any number and type of documents, from interoperable C-CDA documents to binary PDFs. The `$docref` operation returns DocumentReference resources describing these existing documents, but can also cause a document to be newly generated and returned. 

If a server conforms to this specification and also to IPS, this API can be used to generate IPS documents, 
using the [$docref operation](doc-gen.html) with a specific code as defined in the [IPS implementation guide](http://hl7.org/fhir/uv/ips/principles.html#publishing-or-accessing-the-ips).
{:.bg-info}

See the [$docref operation](OperationDefinition-docref.html) for the details.
