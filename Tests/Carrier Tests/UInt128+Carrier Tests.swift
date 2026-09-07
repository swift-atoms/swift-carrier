import Carrier_Test_Support
import Testing

@Suite
struct `UInt128 preserves its carrier representation` {
    @Suite struct `UInt128 carrier conversion round trips through its underlying value` {}
    @Suite struct `UInt128 carrier conversions preserve boundary values` {}
    @Suite struct `UInt128 participates in generic carrier APIs` {}
    @Suite(.serialized) struct `No UInt128 carrier performance cases are defined` {}
}

extension `UInt128 preserves its carrier representation`.`UInt128 carrier conversion round trips through its underlying value` {

    @Test
    func `UInt128 round-trips via underlying`() {
        let v: UInt128 = 123_456_789
        #expect(v.underlying == 123_456_789)
    }

    @Test
    func `UInt128 round-trips via init from underlying`() {
        let v: UInt128 = 99
        #expect(UInt128(v.underlying) == 99)
    }
}

extension `UInt128 preserves its carrier representation`.`UInt128 carrier conversions preserve boundary values` {

    @Test
    func `UInt128 handles min (zero)`() {
        let v: UInt128 = .min
        #expect(v.underlying == 0)
    }

    @Test
    func `UInt128 handles max`() {
        let v: UInt128 = .max
        #expect(v.underlying == .max)
    }
}

extension `UInt128 preserves its carrier representation`.`UInt128 participates in generic carrier APIs` {

    @Test
    func `UInt128 satisfies some Carrier<UInt128>`() {
        #expect(Fixture.value(of: 7 as UInt128) == 7)
    }
}
