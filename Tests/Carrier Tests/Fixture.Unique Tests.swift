import Carrier_Test_Support
import Testing

@Suite
struct `Unique carriers lend noncopyable underlying values` {
    @Suite struct `Unique carrier reads borrow the underlying value` {}
    @Suite struct `Unique carriers preserve zero and negative values` {}
    @Suite struct `Unique carriers satisfy generic carrier requirements` {}
    @Suite(.serialized) struct `No unique carrier performance cases are defined` {}
}

extension `Unique carriers lend noncopyable underlying values`.`Unique carrier reads borrow the underlying value` {

    @Test
    func `Unique reads underlying via borrow`() {
        let c = Fixture.Unique(Fixture.Unique.Resource(raw: 99))
        let raw = c.underlying.raw
        #expect(raw == 99)
    }
}

extension `Unique carriers lend noncopyable underlying values`.`Unique carriers preserve zero and negative values` {

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

extension `Unique carriers lend noncopyable underlying values`.`Unique carriers satisfy generic carrier requirements` {

    @Test
    func `Unique satisfies generic Carrier contract`() {
        let c = Fixture.Unique(Fixture.Unique.Resource(raw: 1))
        let conforms = Fixture.isCarrier(c)
        #expect(conforms)
    }
}
