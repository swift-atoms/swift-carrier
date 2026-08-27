import Carrier
import Carrier_Standard_Library_Integration
import Carrier_Test_Support
import Testing

@Suite
struct `Never+Carrier Tests` {
    @Suite struct Unit {}
    @Suite struct `Edge Case` {}
    @Suite struct Integration {}
    @Suite(.serialized) struct Performance {}
}

extension `Never+Carrier Tests`.`Edge Case` {

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
