## Considerations for internationalization and localization

The International Patient Access specification provides a base underlying specification intended to
be localized by individual countries to meet national laws, regulations and accepted practice.

It also provides for producers of generic patient-facing applications a basis on which to build, so
that the application would be as compatible as possible with as many globally available
implementations as possible.

However, many healthcare systems are inherently local, with not many features useful for true
internationalization and localization implemented.

This base version of the specification aims to provide general guidance rather than hard rules.

### Codeable concepts

To be usable for a wide range of internationally available applications, implementations SHOULD
include codes from internationally supported code sets when they can. It is often not practical to
store resources with textual descriptions in all possible languages, or even to populate this
information on the fly. Rather, it is expected that applications rely on code systems and
terminology servers to obtain human readable terms when required, for the language applicable.
Therefore, implementers are encouraged to focus on providing extensive coverage of various code
sets for codeable data, rather than focusing on support for an extensive number of languages for
international apps and use cases.

Not all available data is always coded, and not all data can be coded with code systems. Also, for
most patients their healthcare is most valuable in the language it is authored with. Therefore,
applications SHALL be able to use the text representation of data elements when presenting data in
a user interface when the coded data cannot be used.

### Non-codeable concepts

There is also information that cannot be easily described with a code system, such as
[person names](https://www.hl7.org/fhir/datatypes.html#HumanName)
and [addresses](https://www.hl7.org/fhir/datatypes.html#address).

To be usable for a wide range of internationally available applications, implementations SHOULD
expose the text element for this kind of data.

