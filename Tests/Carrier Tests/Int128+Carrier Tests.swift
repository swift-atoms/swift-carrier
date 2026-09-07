import Carrier_Test_Support
import Testing

@Suite
struct `Int128 preserves its carrier representation` {
    @Suite struct `Int128 carrier conversion round trips through its underlying value` {}
    @Suite struct `Int128 carrier conversions preserve boundary values` {}
    @Suite struct `Int128 participates in generic carrier APIs` {}
    @Suite(.serialized) struct `No Int128 carrier performance cases are defined` {}
}

extension `Int128 preserves its carrier representation`.`Int128 carrier conversion round trips through its underlying value` {

    @Test
    func `Int128 round-trips via underlying`() {
        let v: Int128 = 123_456_789
        #expect(v.underlying == 123_456_789)
    }

    @Test
    func `Int128 round-trips via init from underlying`() {
        let v: Int128 = 99
        #expect(Int128(v.underlying) == 99)
    }
}

extension `Int128 preserves its carrier representation`.`Int128 carrier conversions preserve boundary values` {

    @Test
    func `Int128 handles min`() {
        let v: Int128 = .min
        #expect(v.underlying == .min)
    }

    @Test
    func `Int128 handles max`() {
        let v: Int128 = .max
        #expect(v.underlying == .max)
    }

    @Test
    func `Int128 handles zero`() {
        let v: Int128 = 0
        #expect(v.underlying == 0)
    }
}

extension `Int128 preserves its carrier representation`.`Int128 participates in generic carrier APIs` {

    @Test
    func `Int128 satisfies some Carrier<Int128>`() {
        #expect(Fixture.value(of: 7 as Int128) == 7)
    }
}
