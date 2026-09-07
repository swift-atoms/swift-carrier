import Carrier_Test_Support
import Testing

@Suite
struct `UInt preserves its carrier representation` {
    @Suite struct `UInt carrier conversion round trips through its underlying value` {}
    @Suite struct `UInt carrier conversions preserve boundary values` {}
    @Suite struct `UInt participates in generic carrier APIs` {}
    @Suite(.serialized) struct `No UInt carrier performance cases are defined` {}
}

extension `UInt preserves its carrier representation`.`UInt carrier conversion round trips through its underlying value` {

    @Test
    func `UInt round-trips via underlying`() {
        let v: UInt = 42
        #expect(v.underlying == 42)
    }

    @Test
    func `UInt round-trips via init from underlying`() {
        let v: UInt = 99
        #expect(UInt(v.underlying) == 99)
    }
}

extension `UInt preserves its carrier representation`.`UInt carrier conversions preserve boundary values` {

    @Test
    func `UInt handles min (zero)`() {
        let v: UInt = .min
        #expect(v.underlying == 0)
    }

    @Test
    func `UInt handles max`() {
        let v: UInt = .max
        #expect(v.underlying == .max)
    }
}

extension `UInt preserves its carrier representation`.`UInt participates in generic carrier APIs` {

    @Test
    func `UInt satisfies some Carrier<UInt>`() {
        #expect(Fixture.value(of: 7 as UInt) == 7)
    }
}
