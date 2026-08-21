public import Carrier_Primitive

extension Carrier.`Protocol` where Underlying == Self {

    @_alwaysEmitIntoClient
    public var underlying: Self {
        _read { yield self }
    }

    @_alwaysEmitIntoClient
    public init(_ underlying: consuming Self) {
        self = underlying
    }
}
