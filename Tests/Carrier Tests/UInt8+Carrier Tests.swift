import Carrier_Test_Support
import Testing

@Suite
struct `UInt8 preserves its carrier representation` {
    @Suite struct `UInt8 carrier conversion round trips through its underlying value` {}
    @Suite struct `UInt8 carrier conversions preserve boundary values` {}
    @Suite struct `UInt8 participates in generic carrier APIs` {}
    @Suite(.serialized) struct `No UInt8 carrier performance cases are defined` {}
}

extension `UInt8 preserves its carrier representation`.`UInt8 carrier conversion round trips through its underlying value` {

    @Test
    func `UInt8 round-trips via underlying`() {
        let v: UInt8 = 42
        #expect(v.underlying == 42)
    }

    @Test
    func `UInt8 round-trips via init from underlying`() {
        let v: UInt8 = 99
        #expect(UInt8(v.underlying) == 99)
    }
}

extension `UInt8 preserves its carrier representation`.`UInt8 carrier conversions preserve boundary values` {

    @Test
    func `UInt8 handles min (zero)`() {
        let v: UInt8 = .min
        #expect(v.underlying == 0)
    }

    @Test
    func `UInt8 handles max`() {
        let v: UInt8 = .max
        #expect(v.underlying == .max)
    }
}

extension `UInt8 preserves its carrier representation`.`UInt8 participates in generic carrier APIs` {

    @Test
    func `UInt8 satisfies some Carrier<UInt8>`() {
        #expect(Fixture.value(of: 7 as UInt8) == 7)
    }
}
