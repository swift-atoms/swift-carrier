import Carrier
import Carrier_Standard_Library_Integration
import Carrier_Test_Support
import Testing

@Suite
struct `StaticString+Carrier Tests` {
    @Suite struct Unit {}
    @Suite struct `Edge Case` {}
    @Suite struct Integration {}
    @Suite(.serialized) struct Performance {}
}

extension `StaticString+Carrier Tests`.Unit {

    @Test
    func `StaticString round-trips via underlying`() {
        let v: StaticString = "hello"
        #expect(v.underlying.description == "hello")
    }
}

extension `StaticString+Carrier Tests`.`Edge Case` {

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

extension `StaticString+Carrier Tests`.Integration {

    @Test
    func `StaticString satisfies some Carrier<StaticString>`() {
        let v: StaticString = "hi"
        #expect(Fixture.value(of: v).description == "hi")
    }
}
