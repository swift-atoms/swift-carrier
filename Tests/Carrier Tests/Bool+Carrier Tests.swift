import Carrier_Test_Support
import Testing

@Suite
struct `Bool preserves its carrier representation` {
    @Suite struct `Bool carrier conversion round trips through its underlying value` {}
    @Suite struct `False Boolean values preserve their carrier representation` {}
    @Suite struct `Bool participates in generic carrier APIs` {}
    @Suite(.serialized) struct `No Bool carrier performance cases are defined` {}
}

extension `Bool preserves its carrier representation`.`Bool carrier conversion round trips through its underlying value` {

    @Test
    func `Bool true round-trips via underlying`() {
        let v: Bool = true
        #expect(v.underlying == true)
    }

    @Test
    func `Bool round-trips via init from underlying`() {
        let v: Bool = true
        #expect(Bool(v.underlying) == true)
    }
}

extension `Bool preserves its carrier representation`.`False Boolean values preserve their carrier representation` {

    @Test
    func `Bool false round-trips via underlying`() {
        let v: Bool = false
        #expect(v.underlying == false)
    }
}

extension `Bool preserves its carrier representation`.`Bool participates in generic carrier APIs` {

    @Test
    func `Bool satisfies some Carrier<Bool>`() {
        #expect(Fixture.value(of: true) == true)
    }
}
