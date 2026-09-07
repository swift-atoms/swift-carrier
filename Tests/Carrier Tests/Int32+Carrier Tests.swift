import Carrier_Test_Support
import Testing

@Suite
struct `Int32 preserves its carrier representation` {
    @Suite struct `Int32 carrier conversion round trips through its underlying value` {}
    @Suite struct `Int32 carrier conversions preserve boundary values` {}
    @Suite struct `Int32 participates in generic carrier APIs` {}
    @Suite(.serialized) struct `No Int32 carrier performance cases are defined` {}
}

extension `Int32 preserves its carrier representation`.`Int32 carrier conversion round trips through its underlying value` {

    @Test
    func `Int32 round-trips via underlying`() {
        let v: Int32 = 42
        #expect(v.underlying == 42)
    }

    @Test
    func `Int32 round-trips via init from underlying`() {
        let v: Int32 = 99
        #expect(Int32(v.underlying) == 99)
    }
}

extension `Int32 preserves its carrier representation`.`Int32 carrier conversions preserve boundary values` {

    @Test
    func `Int32 handles min`() {
        let v: Int32 = .min
        #expect(v.underlying == .min)
    }

    @Test
    func `Int32 handles max`() {
        let v: Int32 = .max
        #expect(v.underlying == .max)
    }

    @Test
    func `Int32 handles zero`() {
        let v: Int32 = 0
        #expect(v.underlying == 0)
    }
}

extension `Int32 preserves its carrier representation`.`Int32 participates in generic carrier APIs` {

    @Test
    func `Int32 satisfies some Carrier<Int32>`() {
        #expect(Fixture.value(of: 7 as Int32) == 7)
    }
}
