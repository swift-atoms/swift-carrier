import Carrier_Test_Support
import Testing

@Suite
struct `UInt64 preserves its carrier representation` {
    @Suite struct `UInt64 carrier conversion round trips through its underlying value` {}
    @Suite struct `UInt64 carrier conversions preserve boundary values` {}
    @Suite struct `UInt64 participates in generic carrier APIs` {}
    @Suite(.serialized) struct `No UInt64 carrier performance cases are defined` {}
}

extension `UInt64 preserves its carrier representation`.`UInt64 carrier conversion round trips through its underlying value` {

    @Test
    func `UInt64 round-trips via underlying`() {
        let v: UInt64 = 42
        #expect(v.underlying == 42)
    }

    @Test
    func `UInt64 round-trips via init from underlying`() {
        let v: UInt64 = 99
        #expect(UInt64(v.underlying) == 99)
    }
}

extension `UInt64 preserves its carrier representation`.`UInt64 carrier conversions preserve boundary values` {

    @Test
    func `UInt64 handles min (zero)`() {
        let v: UInt64 = .min
        #expect(v.underlying == 0)
    }

    @Test
    func `UInt64 handles max`() {
        let v: UInt64 = .max
        #expect(v.underlying == .max)
    }
}

extension `UInt64 preserves its carrier representation`.`UInt64 participates in generic carrier APIs` {

    @Test
    func `UInt64 satisfies some Carrier<UInt64>`() {
        #expect(Fixture.value(of: 7 as UInt64) == 7)
    }
}
