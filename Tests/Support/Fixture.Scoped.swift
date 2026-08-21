public import Carrier_Primitives

extension Fixture {

    public struct Scoped: ~Copyable, ~Escapable {
        var _storage: Fixture.Scoped.Resource

        @_lifetime(copy underlying)
        public init(_ underlying: consuming Fixture.Scoped.Resource) {
            self._storage = underlying
        }
    }
}

extension Fixture.Scoped: Carrier.`Protocol` {
    public typealias Underlying = Fixture.Scoped.Resource

    public var underlying: Fixture.Scoped.Resource {
        @_lifetime(borrow self)
        _read { yield _storage }
    }
}
