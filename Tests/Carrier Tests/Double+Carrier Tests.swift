import Carrier_Test_Support
import Testing

@Suite
struct `Double preserves its carrier representation` {
    @Suite struct `Double carrier conversion round trips through its underlying value` {}
    @Suite struct `Double carrier conversions preserve exceptional floating point values` {}
    @Suite struct `Double participates in generic carrier APIs` {}
    @Suite(.serialized) struct `No Double carrier performance cases are defined` {}
}

extension `Double preserves its carrier representation`.`Double carrier conversion round trips through its underlying value` {

    @Test
    func `Double round-trips via underlying`() {
        let v: Double = 3.14
        #expect(v.underlying == 3.14)
    }

    @Test
    func `Double round-trips via init from underlying`() {
        let v: Double = 2.71828
        #expect(Double(v.underlying) == 2.71828)
    }
}

extension `Double preserves its carrier representation`.`Double carrier conversions preserve exceptional floating point values` {

    @Test
    func `Double handles zero`() {
        let v: Double = 0.0
        #expect(v.underlying == 0.0)
    }

    @Test
    func `Double handles negative zero (preserves sign)`() {
        let v: Double = -0.0
        #expect(v.underlying.bitPattern == Double(-0.0).bitPattern)
    }

    @Test
    func `Double handles infinity`() {
        let v: Double = .infinity
        #expect(v.underlying == .infinity)
    }

    @Test
    func `Double handles negative infinity`() {
        let v: Double = -.infinity
        #expect(v.underlying == -.infinity)
    }

    @Test
    func `Double handles NaN (compared via bitPattern)`() {
        let v: Double = .nan
        #expect(v.underlying.bitPattern == Double.nan.bitPattern)
    }
}

extension `Double preserves its carrier representation`.`Double participates in generic carrier APIs` {

    @Test
    func `Double satisfies some Carrier<Double>`() {
        #expect(Fixture.value(of: 7.5 as Double) == 7.5)
    }
}
