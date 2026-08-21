public import Carrier_Primitives

extension Fixture {

    public struct Plain {
        var _storage: Int

        public init(_ underlying: consuming Int) {
            self._storage = underlying
        }
    }
}

extension Fixture.Plain: Carrier.`Protocol` {
    public typealias Underlying = Int

    public var underlying: Int {
        borrowing get { _storage }
    }
}
