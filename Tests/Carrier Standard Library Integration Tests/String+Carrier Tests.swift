import Carrier
import Carrier_Standard_Library_Integration
import Carrier_Test_Support
import Testing

@Suite
struct `String+Carrier Tests` {
    @Suite struct Unit {}
    @Suite struct `Edge Case` {}
    @Suite struct Integration {}
    @Suite(.serialized) struct Performance {}
}

extension `String+Carrier Tests`.Unit {

    @Test
    func `String round-trips via underlying`() {
        let v: String = "hello"
        #expect(v.underlying == "hello")
    }

    @Test
    func `String round-trips via init from underlying`() {
        let v: String = "world"
        #expect(String(v.underlying) == "world")
    }
}

extension `String+Carrier Tests`.`Edge Case` {

    @Test
    func `String handles empty`() {
        let v: String = ""
        #expect(v.underlying.isEmpty)
    }

    @Test
    func `String handles unicode scalars`() {
        let v: String = "héllo 🌍"
        #expect(v.underlying == "héllo 🌍")
    }

    @Test
    func `String handles long content`() {
        let v: String = String(repeating: "x", count: 10_000)
        #expect(v.underlying.count == 10_000)
    }
}

extension `String+Carrier Tests`.Integration {

    @Test
    func `String satisfies some Carrier<String>`() {
        #expect(Fixture.value(of: "hi" as String) == "hi")
    }
}
