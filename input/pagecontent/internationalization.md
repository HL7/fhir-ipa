## Considerations for internationalization and localization

The International Patient Access specification provides a base underlying specification intended to
be localized by individual countries to meet national laws, regulations and accepted practice.

It also provides for generic patient-facing applications a basis on which to build, so that the
application would be as compatible as possible with as many globally available implementations as
possible.

However, many healthcare systems are inherently local, with not many features useful for true
internationalization and localization implemented.

This version of the specification aims to provide general guidance rather than hard rules.

### Codeable concepts

Implementations SHOULD include codes from internationally supported code sets when they can. It is
often not practical to store resources with textual descriptions in all possible languages, or even
to populate this information on the fly. Rather, it is expected that applications rely on code
systems and terminology servers to obtain human readable terms when required, for the language
applicable. Therefore, implementers are encouraged to focus on providing extensive coverage of
various code sets for codeable data, rather than focusing on extensive language support for
international apps.

### Non-codeable concepts

There is also information that cannot be easily described with a code system, such as person names
and addresses.

The recommendation is for implementations to expose this information in both granular formats
and generic formats.

For applications aiming for large international reach, the fields for generic use are more useful
here. Therefore, implementers interested in wide application support are encouraged to focus on
making the generic fields available.

### Times and timezones

Implementers should be aware that a clock time may be important, as well as the precise moment in
UTC. A proper time stamp, with the real timezone, exposes both. Avoid converting "textual time
stamps" to UTC.

