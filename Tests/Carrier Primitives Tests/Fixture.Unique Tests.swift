import Carrier_Primitives_Test_Support
import Testing

@Suite
struct `Fixture.Unique Tests` {
    @Suite struct Unit {}
    @Suite struct `Edge Case` {}
    @Suite struct Integration {}
    @Suite(.serialized) struct Performance {}
}

extension `Fixture.Unique Tests`.Unit {

    @Test
    func `Unique reads underlying via borrow`() {
        let c = Fixture.Unique(Fixture.Unique.Resource(raw: 99))
        let raw = c.underlying.raw
        #expect(raw == 99)
    }
}

extension `Fixture.Unique Tests`.`Edge Case` {

    @Test
    func `Unique handles raw zero`() {
        let c = Fixture.Unique(Fixture.Unique.Resource(raw: 0))
        #expect(c.underlying.raw == 0)
    }

    @Test
    func `Unique handles negative raw`() {
        let c = Fixture.Unique(Fixture.Unique.Resource(raw: -1))
        #expect(c.underlying.raw == -1)
    }
}

extension `Fixture.Unique Tests`.Integration {

    @Test
    func `Unique satisfies generic Carrier reflection`() {
        let c = Fixture.Unique(Fixture.Unique.Resource(raw: 1))

        let desc = Fixture.describe(c)
        #expect(desc == "Carrier<Resource> with Domain Never")
    }
}
