import Carrier_Test_Support
import Testing

@Suite
struct `Fixture.Scoped Tests` {
    @Suite struct Unit {}
    @Suite struct `Edge Case` {}
    @Suite struct Integration {}
    @Suite(.serialized) struct Performance {}
}

extension `Fixture.Scoped Tests`.Unit {

    @Test
    func `Scoped conforms with noncopyable nonescapable underlying`() {
        let c = Fixture.Scoped(Fixture.Scoped.Resource(raw: 77))
        let raw = c.underlying.raw
        #expect(raw == 77)
    }
}

extension `Fixture.Scoped Tests`.`Edge Case` {

    @Test
    func `Scoped handles raw zero`() {
        let c = Fixture.Scoped(Fixture.Scoped.Resource(raw: 0))
        #expect(c.underlying.raw == 0)
    }

    @Test
    func `Scoped handles negative raw`() {
        let c = Fixture.Scoped(Fixture.Scoped.Resource(raw: -42))
        #expect(c.underlying.raw == -42)
    }
}

extension `Fixture.Scoped Tests`.Integration {

    @Test
    func `Scoped satisfies generic Carrier contract`() {
        let c = Fixture.Scoped(Fixture.Scoped.Resource(raw: 5))
        let conforms = Fixture.isCarrier(c)
        #expect(conforms)
    }
}
