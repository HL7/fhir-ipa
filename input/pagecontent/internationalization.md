
The International Patient Access specification provides an underlying base specification intended to
be localized by individual countries to meet national laws, regulations, and accepted practices.

It also provides producers of generic patient-facing applications a basis on which to build, so
that the application would be as compatible as possible with as many globally available
implementations as possible.

__This base version of the specification aims to provide general guidance rather than rigid rules.
The authors of the specification welcome feedback and suggestions on what should be required of
implementations.__

### Language

This version of the specification makes no specific rules around language. However, future versions of IPA and specifications derived from IPA are expected to impose constraints and recommendations.

### Codeable Concepts

Implementations SHOULD include codes from internationally supported code sets since it would make applications more internationally portable. It is often not practical to
store resources with textual descriptions in multiple languages or populate this information on the fly. Instead, applications are expected to rely on code systems and terminology servers to obtain human-readable terms for the appropriate language when required.
Therefore, implementers are encouraged to focus on providing extensive coverage of various code sets for codeable data rather than focusing on support for multiple languages for international apps and use cases.

Not all available data is always coded, and not all data can be coded with code systems. Also, for most patients, their healthcare is most valuable in its original authored language. Therefore,  when the coded data cannot be used, applications SHALL be able to use the text representation of data elements when presenting data in a user interface.

### Non-Codeable Concepts

There is also information that cannot be easily described with a code system, such as
[person names]({{site.data.fhir.path}}datatypes.html#HumanName)
and [addresses]({{site.data.fhir.path}}datatypes.html#address).

Therefore, implementations SHOULD expose the text element for this kind of data to be usable for a wide range of internationally available applications.
