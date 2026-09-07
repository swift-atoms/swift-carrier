import Carrier_Test_Support
import Testing

@Suite
struct `Float preserves its carrier representation` {
    @Suite struct `Float carrier conversion round trips through its underlying value` {}
    @Suite struct `Float carrier conversions preserve exceptional floating point values` {}
    @Suite struct `Float participates in generic carrier APIs` {}
    @Suite(.serialized) struct `No Float carrier performance cases are defined` {}
}

extension `Float preserves its carrier representation`.`Float carrier conversion round trips through its underlying value` {

    @Test
    func `Float round-trips via underlying`() {
        let v: Float = 1.5
        #expect(v.underlying == 1.5)
    }

    @Test
    func `Float round-trips via init from underlying`() {
        let v: Float = 2.5
        #expect(Float(v.underlying) == 2.5)
    }
}

extension `Float preserves its carrier representation`.`Float carrier conversions preserve exceptional floating point values` {

    @Test
    func `Float handles zero`() {
        let v: Float = 0.0
        #expect(v.underlying == 0.0)
    }

    @Test
    func `Float handles negative zero (preserves sign)`() {
        let v: Float = -0.0
        #expect(v.underlying.bitPattern == Float(-0.0).bitPattern)
    }

    @Test
    func `Float handles infinity`() {
        let v: Float = .infinity
        #expect(v.underlying == .infinity)
    }

    @Test
    func `Float handles NaN (compared via bitPattern)`() {
        let v: Float = .nan
        #expect(v.underlying.bitPattern == Float.nan.bitPattern)
    }
}

extension `Float preserves its carrier representation`.`Float participates in generic carrier APIs` {

    @Test
    func `Float satisfies some Carrier<Float>`() {
        #expect(Fixture.value(of: 7.5 as Float) == 7.5)
    }
}
