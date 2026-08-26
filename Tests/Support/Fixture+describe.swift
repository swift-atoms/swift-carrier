public import Carrier

extension Fixture {

    public static func isCarrier<C: Carrier.`Protocol` & ~Copyable & ~Escapable>(
        _: borrowing C
    ) -> Bool
    where C.Domain: ~Copyable & ~Escapable, C.Underlying: ~Copyable & ~Escapable {
        true
    }

    public static func isCarrier<C: Carrier.`Protocol` & ~Copyable & ~Escapable>(
        _: C.Type
    ) -> Bool
    where C.Domain: ~Copyable & ~Escapable, C.Underlying: ~Copyable & ~Escapable {
        true
    }

    public static func describe<C: Carrier.`Protocol` & ~Copyable & ~Escapable>(
        _ c: borrowing C
    ) -> String {
        "Carrier<\(C.Underlying.self)> with Domain \(C.Domain.self)"
    }

    public static func describe<C: Carrier.`Protocol` & ~Copyable & ~Escapable>(
        domain _: C.Type
    ) -> String {
        "\(C.Domain.self)"
    }
}
