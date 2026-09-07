import Carrier_Test_Support
import Testing

@Suite
struct `Scoped carriers preserve noncopyable and nonescapable capabilities` {
    @Suite struct `Scoped carriers admit noncopyable nonescapable underlying values` {}
    @Suite struct `Scoped carriers preserve zero and negative values` {}
    @Suite struct `Scoped carriers satisfy generic carrier requirements` {}
    @Suite(.serialized) struct `No scoped carrier performance cases are defined` {}
}

extension `Scoped carriers preserve noncopyable and nonescapable capabilities`.`Scoped carriers admit noncopyable nonescapable underlying values` {

    @Test
    func `Scoped conforms with noncopyable nonescapable underlying`() {
        let c = Fixture.Scoped(Fixture.Scoped.Resource(raw: 77))
        let raw = c.underlying.raw
        #expect(raw == 77)
    }
}

extension `Scoped carriers preserve noncopyable and nonescapable capabilities`.`Scoped carriers preserve zero and negative values` {

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

extension `Scoped carriers preserve noncopyable and nonescapable capabilities`.`Scoped carriers satisfy generic carrier requirements` {

    @Test
    func `Scoped satisfies generic Carrier contract`() {
        let c = Fixture.Scoped(Fixture.Scoped.Resource(raw: 5))
        let conforms = Fixture.isCarrier(c)
        #expect(conforms)
    }
}
