import Carrier_Test_Support
import Testing

@Suite
struct `Int16 preserves its carrier representation` {
    @Suite struct `Int16 carrier conversion round trips through its underlying value` {}
    @Suite struct `Int16 carrier conversions preserve boundary values` {}
    @Suite struct `Int16 participates in generic carrier APIs` {}
    @Suite(.serialized) struct `No Int16 carrier performance cases are defined` {}
}

extension `Int16 preserves its carrier representation`.`Int16 carrier conversion round trips through its underlying value` {

    @Test
    func `Int16 round-trips via underlying`() {
        let v: Int16 = 42
        #expect(v.underlying == 42)
    }

    @Test
    func `Int16 round-trips via init from underlying`() {
        let v: Int16 = 99
        #expect(Int16(v.underlying) == 99)
    }
}

extension `Int16 preserves its carrier representation`.`Int16 carrier conversions preserve boundary values` {

    @Test
    func `Int16 handles min`() {
        let v: Int16 = .min
        #expect(v.underlying == .min)
    }

    @Test
    func `Int16 handles max`() {
        let v: Int16 = .max
        #expect(v.underlying == .max)
    }

    @Test
    func `Int16 handles zero`() {
        let v: Int16 = 0
        #expect(v.underlying == 0)
    }
}

extension `Int16 preserves its carrier representation`.`Int16 participates in generic carrier APIs` {

    @Test
    func `Int16 satisfies some Carrier<Int16>`() {
        #expect(Fixture.value(of: 7 as Int16) == 7)
    }
}
