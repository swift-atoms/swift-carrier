import Carrier_Test_Support
import Testing

@Suite
struct `Substring preserves its carrier representation` {
    @Suite struct `Substring carrier conversion round trips through its underlying value` {}
    @Suite struct `Substring carrier conversion preserves text boundaries and Unicode content` {}
    @Suite struct `Substring participates in generic carrier APIs` {}
    @Suite(.serialized) struct `No Substring carrier performance cases are defined` {}
}

extension `Substring preserves its carrier representation`.`Substring carrier conversion round trips through its underlying value` {

    @Test
    func `Substring round-trips via underlying`() {
        let full = "hello world"
        let v: Substring = full.prefix(5)
        #expect(v.underlying == "hello")
    }
}

extension `Substring preserves its carrier representation`.`Substring carrier conversion preserves text boundaries and Unicode content` {

    @Test
    func `Substring handles empty slice`() {
        let full = "hello"
        let v: Substring = full.prefix(0)
        #expect(v.underlying.isEmpty)
    }

    @Test
    func `Substring handles full-string slice`() {
        let full = "hello"
        let v: Substring = full[...]
        #expect(v.underlying == "hello")
    }

    @Test
    func `Substring handles unicode boundary`() {
        let full = "héllo 🌍"
        let v: Substring = full.dropLast()
        #expect(v.underlying == "héllo ")
    }
}

extension `Substring preserves its carrier representation`.`Substring participates in generic carrier APIs` {

    @Test
    func `Substring satisfies some Carrier<Substring>`() {
        let v: Substring = "hello".prefix(3)
        #expect(Fixture.value(of: v) == "hel")
    }
}
