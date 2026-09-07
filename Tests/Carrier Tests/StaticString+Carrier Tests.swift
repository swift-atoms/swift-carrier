import Carrier_Test_Support
import Testing

@Suite
struct `StaticString preserves its carrier representation` {
    @Suite struct `StaticString carrier conversion round trips through its underlying value` {}
    @Suite struct `StaticString carrier conversion preserves text boundaries and Unicode content` {}
    @Suite struct `StaticString participates in generic carrier APIs` {}
    @Suite(.serialized) struct `No StaticString carrier performance cases are defined` {}
}

extension `StaticString preserves its carrier representation`.`StaticString carrier conversion round trips through its underlying value` {

    @Test
    func `StaticString round-trips via underlying`() {
        let v: StaticString = "hello"
        #expect(v.underlying.description == "hello")
    }
}

extension `StaticString preserves its carrier representation`.`StaticString carrier conversion preserves text boundaries and Unicode content` {

    @Test
    func `StaticString handles empty literal`() {
        let v: StaticString = ""
        #expect(v.underlying.description.isEmpty)
    }

    @Test
    func `StaticString handles unicode literal`() {
        let v: StaticString = "héllo 🌍"
        #expect(v.underlying.description == "héllo 🌍")
    }

    @Test
    func `StaticString preserves UTF-8 byte count`() {
        let v: StaticString = "abc"
        #expect(v.underlying.utf8CodeUnitCount == 3)
    }
}

extension `StaticString preserves its carrier representation`.`StaticString participates in generic carrier APIs` {

    @Test
    func `StaticString satisfies some Carrier<StaticString>`() {
        let v: StaticString = "hi"
        #expect(Fixture.value(of: v).description == "hi")
    }
}
