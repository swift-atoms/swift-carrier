# swift-carrier

Use this package when you write code that should accept any value wrapping an underlying representation, generically over whether that wrapper or its underlying value is copyable or escapable: constrain on `Carrier.Protocol` (for example `some Carrier.Protocol<Int>`) and read `underlying`, or conform your own wrapper to it. `Domain` is a phantom tag that keeps two carriers of the same `Carrier.Protocol.Underlying` apart; `Never` means the carrier has no domain. To get a ready-made wrapper that tags an underlying value with a domain, use the sibling package swift-tagged instead of conforming a new type.

## Laws

- Round trip: for every conformer `C`, `C(c.underlying)` is the same value as `c`, and `C(u).underlying` is `u`.
- `init(_:validate:)` runs `validate` once, on the borrowed underlying value, before the carrier exists. If `validate` throws, no carrier is constructed and that error propagates unchanged.
- A conformer whose `Carrier.Protocol.Underlying` is `Self` gets defaults in which `underlying` yields `self` and `init(_:)` is the identity. The standard-library conformances in this package are all such self-carriers with `Domain` left at `Never`.
- The bitwise and shift operators are opt-in: only a conformer of `Carrier.Bitwise.Protocol`, whose `Carrier.Protocol.Underlying` is a `FixedWidthInteger`, gets them. They compute on the underlying values and rewrap the result through `init(_:)`, so they run no validation; conform only a carrier whose every underlying value is valid. They are disfavored overloads: an operator declared on the concrete type always wins. Shifts keep `FixedWidthInteger`'s smart-shift behaviour. `isZero` and `isNonZero`, which construct nothing, apply to every carrier whose underlying value is a `FixedWidthInteger` and compare it with `0`.
