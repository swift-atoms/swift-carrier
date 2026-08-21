public import Carrier_Primitives

extension Fixture {

    public static func value<U: Copyable>(of c: borrowing some Carrier.`Protocol`<U>) -> U {
        c.underlying
    }
}
