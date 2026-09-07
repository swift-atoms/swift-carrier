import Carrier_Test_Support
import Testing

@Suite
struct `Never satisfies carrier requirements at the type level` {
    @Suite struct `No Never carrier construction cases are defined` {}
    @Suite struct `Never exposes its carrier associated types without constructing values` {}
    @Suite struct `No Never carrier integration cases are defined` {}
    @Suite(.serialized) struct `No Never carrier performance cases are defined` {}
}

extension `Never satisfies carrier requirements at the type level`.`Never exposes its carrier associated types without constructing values` {

    @Test
    func `Never conforms to Carrier at the type level`() {
        let conforms = Fixture.isCarrier(Never.self)
        #expect(conforms)
    }

    @Test
    func `Never's Underlying is Never at the type level`() {
        #expect(Never.Underlying.self == Never.self)
    }

    @Test
    func `Never's Domain defaults to Never`() {
        #expect(Never.Domain.self == Never.self)
    }
}
