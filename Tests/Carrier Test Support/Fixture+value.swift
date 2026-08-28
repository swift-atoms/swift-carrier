public import Carrier_Protocol

extension Fixture {

    public static func value<U: Copyable>(of c: borrowing some Carrier.`Protocol`<U>) -> U {
        c.underlying
    }
}
