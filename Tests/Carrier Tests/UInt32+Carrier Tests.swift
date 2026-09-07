import Carrier_Test_Support
import Testing

@Suite
struct `UInt32 preserves its carrier representation` {
    @Suite struct `UInt32 carrier conversion round trips through its underlying value` {}
    @Suite struct `UInt32 carrier conversions preserve boundary values` {}
    @Suite struct `UInt32 participates in generic carrier APIs` {}
    @Suite(.serialized) struct `No UInt32 carrier performance cases are defined` {}
}

extension `UInt32 preserves its carrier representation`.`UInt32 carrier conversion round trips through its underlying value` {

    @Test
    func `UInt32 round-trips via underlying`() {
        let v: UInt32 = 42
        #expect(v.underlying == 42)
    }

    @Test
    func `UInt32 round-trips via init from underlying`() {
        let v: UInt32 = 99
        #expect(UInt32(v.underlying) == 99)
    }
}

extension `UInt32 preserves its carrier representation`.`UInt32 carrier conversions preserve boundary values` {

    @Test
    func `UInt32 handles min (zero)`() {
        let v: UInt32 = .min
        #expect(v.underlying == 0)
    }

    @Test
    func `UInt32 handles max`() {
        let v: UInt32 = .max
        #expect(v.underlying == .max)
    }
}

extension `UInt32 preserves its carrier representation`.`UInt32 participates in generic carrier APIs` {

    @Test
    func `UInt32 satisfies some Carrier<UInt32>`() {
        #expect(Fixture.value(of: 7 as UInt32) == 7)
    }
}
