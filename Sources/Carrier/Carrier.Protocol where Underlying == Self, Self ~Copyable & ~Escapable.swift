extension Carrier.`Protocol` where Underlying == Self, Self: ~Copyable & ~Escapable {

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
