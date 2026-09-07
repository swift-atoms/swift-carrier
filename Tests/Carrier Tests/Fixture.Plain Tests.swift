import Carrier_Test_Support
import Testing

@Suite
struct `Plain carriers preserve their stored integer values` {
    @Suite struct `Plain carriers store and round trip integers` {}
    @Suite struct `Plain carriers preserve integer extremes` {}
    @Suite struct `Plain carriers expose their underlying integer and default domain` {}
    @Suite(.serialized) struct `No plain carrier performance cases are defined` {}
}

extension `Plain carriers preserve their stored integer values`.`Plain carriers store and round trip integers` {

    @Test
    func `Plain stores and reads Int underlying`() {
        let c = Fixture.Plain(42)
        #expect(c.underlying == 42)
    }

    @Test
    func `Plain round-trips via init from underlying`() {
        let a = Fixture.Plain(100)
        let b = Fixture.Plain(a.underlying)
        #expect(a.underlying == b.underlying)
    }
}

extension `Plain carriers preserve their stored integer values`.`Plain carriers preserve integer extremes` {

    @Test
    func `Plain handles Int min`() {
        let c = Fixture.Plain(.min)
        #expect(c.underlying == .min)
    }

    @Test
    func `Plain handles Int max`() {
        let c = Fixture.Plain(.max)
        #expect(c.underlying == .max)
    }

    @Test
    func `Plain handles zero`() {
        let c = Fixture.Plain(0)
        #expect(c.underlying == 0)
    }
}

extension `Plain carriers preserve their stored integer values`.`Plain carriers expose their underlying integer and default domain` {

    @Test
    func `Plain satisfies some Carrier<Int>`() {
        let c = Fixture.Plain(55)
        #expect(Fixture.value(of: c) == 55)
    }

    @Test
    func `Plain reflects Underlying = Int and Domain = Never`() {
        let c = Fixture.Plain(7)
        #expect(Fixture.describe(c) == "Carrier<Int> with Domain Never")
    }
}
