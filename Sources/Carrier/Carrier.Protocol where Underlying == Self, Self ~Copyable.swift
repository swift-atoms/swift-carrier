
extension Carrier.`Protocol` where Underlying == Self, Self: ~Copyable {

    @_alwaysEmitIntoClient
    public var underlying: Self {
        _read { yield self }
    }

    @_alwaysEmitIntoClient
    public init(_ underlying: consuming Self) {
        self = underlying
    }
}
