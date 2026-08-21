public import Carrier_Primitive

extension Carrier.`Protocol` where Underlying == Self, Self: ~Escapable {

    @_alwaysEmitIntoClient
    public var underlying: Self {
        @_lifetime(borrow self)
        _read { yield self }
    }

    @_alwaysEmitIntoClient
    @_lifetime(copy underlying)
    public init(_ underlying: consuming Self) {
        self = underlying
    }
}
