import Carrier_Test_Support
import Testing

@Suite
struct `Carrier Tests` {
    @Suite struct Unit {}
    @Suite struct `Edge Case` {}
    @Suite struct Integration {}
    @Suite(.serialized) struct Performance {}
}

extension `Carrier Tests`.Integration {

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
