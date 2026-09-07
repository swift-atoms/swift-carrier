import Carrier_Test_Support
import Testing

#if os(iOS) || os(tvOS) || os(watchOS) || os(visionOS) || ((os(macOS) || targetEnvironment(macCatalyst)) && arch(arm64))

    @Suite
    struct `Float16 preserves its carrier representation` {
        @Suite struct `Float16 carrier conversion round trips through its underlying value` {}
        @Suite struct `Float16 carrier conversions preserve exceptional floating point values` {}
        @Suite struct `Float16 participates in generic carrier APIs` {}
        @Suite(.serialized) struct `No Float16 carrier performance cases are defined` {}
    }

    extension `Float16 preserves its carrier representation`.`Float16 carrier conversion round trips through its underlying value` {

        @Test
        func `Float16 round-trips via underlying`() {
            let v: Float16 = 1.5
            #expect(v.underlying == 1.5)
        }

        @Test
        func `Float16 round-trips via init from underlying`() {
            let v: Float16 = 2.5
            #expect(Float16(v.underlying) == 2.5)
        }
    }

    extension `Float16 preserves its carrier representation`.`Float16 carrier conversions preserve exceptional floating point values` {

        @Test
        func `Float16 handles zero`() {
            let v: Float16 = 0.0
            #expect(v.underlying == 0.0)
        }

        @Test
        func `Float16 handles infinity`() {
            let v: Float16 = .infinity
            #expect(v.underlying == .infinity)
        }

        @Test
        func `Float16 handles NaN (compared via bitPattern)`() {
            let v: Float16 = .nan
            #expect(v.underlying.bitPattern == Float16.nan.bitPattern)
        }
    }

    extension `Float16 preserves its carrier representation`.`Float16 participates in generic carrier APIs` {

        @Test
        func `Float16 satisfies some Carrier<Float16>`() {
            #expect(Fixture.value(of: 1.5 as Float16) == 1.5)
        }
    }

#endif
