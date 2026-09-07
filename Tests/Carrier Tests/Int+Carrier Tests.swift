import Carrier_Test_Support
import Testing

@Suite
struct `Int preserves its carrier representation` {
    @Suite struct `Int carrier conversion round trips through its underlying value` {}
    @Suite struct `Int carrier conversions preserve boundary values` {}
    @Suite struct `Int participates in generic carrier APIs` {}
    @Suite(.serialized) struct `No Int carrier performance cases are defined` {}
}

extension `Int preserves its carrier representation`.`Int carrier conversion round trips through its underlying value` {

    @Test
    func `Int round-trips via underlying`() {
        let v: Int = 42
        #expect(v.underlying == 42)
    }

    @Test
    func `Int round-trips via init from underlying`() {
        let v: Int = 99
        #expect(Int(v.underlying) == 99)
    }
}

extension `Int preserves its carrier representation`.`Int carrier conversions preserve boundary values` {

    @Test
    func `Int handles min`() {
        let v: Int = .min
        #expect(v.underlying == .min)
    }

    @Test
    func `Int handles max`() {
        let v: Int = .max
        #expect(v.underlying == .max)
    }

    @Test
    func `Int handles zero`() {
        let v: Int = 0
        #expect(v.underlying == 0)
    }
}

extension `Int preserves its carrier representation`.`Int participates in generic carrier APIs` {

    @Test
    func `Int satisfies some Carrier<Int>`() {
        #expect(Fixture.value(of: 77 as Int) == 77)
    }
}
