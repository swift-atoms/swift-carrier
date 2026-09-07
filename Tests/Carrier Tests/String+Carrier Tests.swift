import Carrier_Test_Support
import Testing

@Suite
struct `String preserves its carrier representation` {
    @Suite struct `String carrier conversion round trips through its underlying value` {}
    @Suite struct `String carrier conversion preserves text boundaries and Unicode content` {}
    @Suite struct `String participates in generic carrier APIs` {}
    @Suite(.serialized) struct `No String carrier performance cases are defined` {}
}

extension `String preserves its carrier representation`.`String carrier conversion round trips through its underlying value` {

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

extension `String preserves its carrier representation`.`String carrier conversion preserves text boundaries and Unicode content` {

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

extension `String preserves its carrier representation`.`String participates in generic carrier APIs` {

    @Test
    func `String satisfies some Carrier<String>`() {
        #expect(Fixture.value(of: "hi" as String) == "hi")
    }
}
