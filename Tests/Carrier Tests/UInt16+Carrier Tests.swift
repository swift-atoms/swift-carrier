import Carrier_Test_Support
import Testing

@Suite
struct `UInt16 preserves its carrier representation` {
    @Suite struct `UInt16 carrier conversion round trips through its underlying value` {}
    @Suite struct `UInt16 carrier conversions preserve boundary values` {}
    @Suite struct `UInt16 participates in generic carrier APIs` {}
    @Suite(.serialized) struct `No UInt16 carrier performance cases are defined` {}
}

extension `UInt16 preserves its carrier representation`.`UInt16 carrier conversion round trips through its underlying value` {

    @Test
    func `UInt16 round-trips via underlying`() {
        let v: UInt16 = 42
        #expect(v.underlying == 42)
    }

    @Test
    func `UInt16 round-trips via init from underlying`() {
        let v: UInt16 = 99
        #expect(UInt16(v.underlying) == 99)
    }
}

extension `UInt16 preserves its carrier representation`.`UInt16 carrier conversions preserve boundary values` {

    @Test
    func `UInt16 handles min (zero)`() {
        let v: UInt16 = .min
        #expect(v.underlying == 0)
    }

    @Test
    func `UInt16 handles max`() {
        let v: UInt16 = .max
        #expect(v.underlying == .max)
    }
}

extension `UInt16 preserves its carrier representation`.`UInt16 participates in generic carrier APIs` {

    @Test
    func `UInt16 satisfies some Carrier<UInt16>`() {
        #expect(Fixture.value(of: 7 as UInt16) == 7)
    }
}
