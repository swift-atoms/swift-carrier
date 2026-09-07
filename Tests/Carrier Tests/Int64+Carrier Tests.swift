import Carrier_Test_Support
import Testing

@Suite
struct `Int64 preserves its carrier representation` {
    @Suite struct `Int64 carrier conversion round trips through its underlying value` {}
    @Suite struct `Int64 carrier conversions preserve boundary values` {}
    @Suite struct `Int64 participates in generic carrier APIs` {}
    @Suite(.serialized) struct `No Int64 carrier performance cases are defined` {}
}

extension `Int64 preserves its carrier representation`.`Int64 carrier conversion round trips through its underlying value` {

    @Test
    func `Int64 round-trips via underlying`() {
        let v: Int64 = 42
        #expect(v.underlying == 42)
    }

    @Test
    func `Int64 round-trips via init from underlying`() {
        let v: Int64 = 99
        #expect(Int64(v.underlying) == 99)
    }
}

extension `Int64 preserves its carrier representation`.`Int64 carrier conversions preserve boundary values` {

    @Test
    func `Int64 handles min`() {
        let v: Int64 = .min
        #expect(v.underlying == .min)
    }

    @Test
    func `Int64 handles max`() {
        let v: Int64 = .max
        #expect(v.underlying == .max)
    }

    @Test
    func `Int64 handles zero`() {
        let v: Int64 = 0
        #expect(v.underlying == 0)
    }
}

extension `Int64 preserves its carrier representation`.`Int64 participates in generic carrier APIs` {

    @Test
    func `Int64 satisfies some Carrier<Int64>`() {
        #expect(Fixture.value(of: 7 as Int64) == 7)
    }
}
