import Carrier_Test_Support
import Testing

@Suite
struct `Carrier constraints expose underlying values and domains` {
    @Suite struct `No carrier protocol construction cases are defined` {}
    @Suite struct `No carrier protocol boundary cases are defined` {}
    @Suite struct `Generic carrier dispatch preserves associated types and domains` {}
    @Suite(.serialized) struct `No carrier protocol performance cases are defined` {}
}

extension `Carrier constraints expose underlying values and domains`.`Generic carrier dispatch preserves associated types and domains` {

    @Test
    func `describe reflects Underlying and Domain at type level`() {
        let c = Fixture.Plain(7)
        let desc = Fixture.describe(c)
        #expect(desc == "Carrier<Int> with Domain Never")
    }

    @Test
    func `value accepts Plain via parameterized constraint`() {
        let c = Fixture.Plain(55)
        #expect(Fixture.value(of: c) == 55)
    }

    @Test
    func `Domain-constrained generic resolves Never for default-Domain conformer`() {

        let c = Fixture.Plain(42)
        let d = Fixture.describe(domain: type(of: c))
        #expect(d == "Never")
    }
}
