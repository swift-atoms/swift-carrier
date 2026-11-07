extension Carrier {

    public typealias `Protocol` = _CarrierProtocol
}

extension Carrier.`Protocol`
where
    Self: ~Copyable & ~Escapable,
    Underlying: ~Copyable & ~Escapable
{

    @_alwaysEmitIntoClient
    @_lifetime(copy underlying)
    public init<E: Swift::Error>(
        _ underlying: consuming Underlying,
        validate: (borrowing Underlying) throws(E) -> Void
    ) throws(E) {
        try validate(underlying)
        self.init(underlying)
    }
}
