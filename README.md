# Carrier

![Development Status](https://img.shields.io/badge/status-active--development-blue.svg)

Unified super-protocol for phantom-typed value wrappers — `Carrier.\`Protocol\`<Underlying>` spans Cardinal, Ordinal, Hash.Value, Tagged, and move-only resource wrappers across all four `Copyable × Escapable` quadrants.

---

## Quick Start

Nest an identifier wrapper under a real domain type and conform it to `Carrier.\`Protocol\`` via a standalone extension. The phantom `Domain` reuses the existing type as a compile-time tag — `User.ID` and `Order.ID` both wrap `UInt64`, but generic code distinguishes them:

```swift
import Carrier_Protocol

struct User {
    var name: String
    var email: String
}

extension User {
    struct ID {
        var _storage: UInt64

        init(_ underlying: consuming UInt64) {
            self._storage = underlying
        }
    }
}

extension User.ID: Carrier.`Protocol` {
    typealias Domain = User
    typealias Underlying = UInt64

    var underlying: UInt64 {
        borrowing get { _storage }
    }
}
```

The convenience alias `Carrying` reads as a verb-form predicate at conformance sites if you prefer:

```swift
extension User.ID: Carrying { ... }  // equivalent to Carrier.`Protocol`
```

The same recipe works for `~Copyable` resource wrappers — a shape `RawRepresentable` cannot express at all:

```swift
enum File {}

extension File {
    struct Descriptor: ~Copyable {
        var raw: Int32
    }
}

extension File {
    struct Handle: ~Copyable {
        var _storage: File.Descriptor

        init(_ underlying: consuming File.Descriptor) {
            self._storage = underlying
        }
    }
}

extension File.Handle: Carrier.`Protocol` {
    typealias Underlying = File.Descriptor

    var underlying: File.Descriptor {
        _read { yield _storage }
    }
}
```

Both `User.ID` and `File.Handle` reach `some Carrier.\`Protocol\`<UInt64>` / `some Carrier.\`Protocol\`<File.Descriptor>` API sites without additional plumbing. The DocC tutorial walks through the first example step by step; the Conformance Recipes article covers the other three `Copyable × Escapable` quadrants; the Carrier vs RawRepresentable article documents where the two protocols diverge.

---

## Installation

```swift
dependencies: [
    .package(url: "https://github.com/swift-atoms/swift-carrier.git", branch: "main")
]
```

```swift
.target(
    name: "App",
    dependencies: [
        .product(name: "Carrier Protocol", package: "swift-carrier"),
    ]
)
```

Requires Swift 6.3.1 and macOS 26 / iOS 26 / tvOS 26 / watchOS 26 / visionOS 26 (or the matching Linux / Windows toolchain).

---

## Architecture

Four library products, zero external dependencies.

| Product | Target | Purpose |
|---------|--------|---------|
| `Carrier` | `Sources/Carrier/` | The base `Carrier` namespace. |
| `Carrier Protocol` | `Sources/Carrier Protocol/` | The `Carrier.\`Protocol\`<Underlying>` protocol + `extension Carrier.\`Protocol\` where Underlying == Self` default for trivial self-carriers and the convenience alias `Carrying`. |
| `Carrier Standard Library Integration` | `Sources/Carrier Standard Library Integration/` | Conforms 28 standard-library types (integer families, floating-point, `Bool`, `String`, `Substring`, `Character`, `Unicode.Scalar`, `StaticString`, `Duration`, `ObjectIdentifier`, `Never`, plus the `~Escapable` span types `Span` / `MutableSpan` / `RawSpan` / `MutableRawSpan`) to `Carrier.\`Protocol\`` as trivial self-carriers. |
| `Carrier Test Support` | `Tests/Carrier Test Support/` | Provides reusable protocol fixtures and reexports the protocol and integration layers for test consumers. |

Import the narrowest product you need: `Carrier Protocol` for the protocol alone, or `Carrier Standard Library Integration` (which reexports the protocol layer) when you want bare standard-library values to reach `some Carrier.\`Protocol\`<Int>` / `some Carrier.\`Protocol\`<String>` API sites.

Foundation-free.

---

## Platform Support

| Platform | Status |
|----------|--------|
| macOS 26 | Full support |
| Linux | Full support |
| Windows | Full support |
| iOS / tvOS / watchOS / visionOS | Supported |
| Swift Embedded | Supported |

---

## License

Apache 2.0. See [LICENSE.md](LICENSE.md).
