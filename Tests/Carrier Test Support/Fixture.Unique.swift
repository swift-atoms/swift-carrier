public import Carrier_Protocol

extension Fixture {

    public struct Unique: ~Copyable {
        var _storage: Fixture.Unique.Resource

        public init(_ underlying: consuming Fixture.Unique.Resource) {
            self._storage = underlying
        }
    }
}

extension Fixture.Unique: Carrier.`Protocol` {
    public typealias Underlying = Fixture.Unique.Resource

    public var underlying: Fixture.Unique.Resource {
        _read { yield _storage }
    }
}
