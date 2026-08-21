public import Carrier_Primitives

extension Fixture {

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
