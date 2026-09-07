
## Module organization

Import `Carrier` to use the core API, including the protocols and operations formerly supplied by separate modules. It has no external module dependencies. Dependency exports live in `Sources/Carrier/exports.swift`.

Import `Carrier_Standard_Library_Integration` for standard-library integration APIs.

`Carrier Test Support` lives in `Tests/Support`. Foundation integration can be added as `Carrier Foundation Library Integration` when needed.
