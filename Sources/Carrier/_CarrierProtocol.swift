public protocol _CarrierProtocol<Underlying>: ~Copyable, ~Escapable {

    associatedtype Domain: ~Copyable & ~Escapable = Never

    associatedtype Underlying: ~Copyable & ~Escapable

    var underlying: Underlying {
        @_lifetime(borrow self)
        borrowing get
    }

    @_lifetime(copy underlying)
    init(_ underlying: consuming Underlying)
}
