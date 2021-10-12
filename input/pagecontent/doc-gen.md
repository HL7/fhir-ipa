# Generating Patient Documents

A patient's record may contain any number and type of documents, from interoperable CCDs to binary PDFs. The `$ipa-docref` operation returns DocumentReference resources describing these existing documents, but can also cause a document to be newly generated and returned. By default the generated document is a C-CDA Clinical Summary of Care (CCD).

See the [#ipa-docref operation](OperationDefinition-ipa-docref.html) for the details.
