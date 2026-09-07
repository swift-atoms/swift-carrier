import Carrier_Test_Support
import Testing

@Suite
struct `Duration preserves its carrier representation` {
    @Suite struct `Duration carrier conversion round trips through its underlying value` {}
    @Suite struct `Duration carrier conversion preserves sign precision and large values` {}
    @Suite struct `Duration participates in generic carrier APIs` {}
    @Suite(.serialized) struct `No Duration carrier performance cases are defined` {}
}

extension `Duration preserves its carrier representation`.`Duration carrier conversion round trips through its underlying value` {

    @Test
    func `Duration round-trips via underlying`() {
        let v: Duration = .milliseconds(500)
        #expect(v.underlying == .milliseconds(500))
    }
}

extension `Duration preserves its carrier representation`.`Duration carrier conversion preserves sign precision and large values` {

    @Test
    func `Duration handles zero`() {
        let v: Duration = .zero
        #expect(v.underlying == .zero)
    }

    @Test
    func `Duration handles negative`() {
        let v: Duration = .milliseconds(-1)
        #expect(v.underlying == .milliseconds(-1))
    }

    @Test
    func `Duration handles nanosecond resolution`() {
        let v: Duration = .nanoseconds(1)
        #expect(v.underlying == .nanoseconds(1))
    }

    @Test
    func `Duration handles large values`() {
        let v: Duration = .seconds(86_400)
        #expect(v.underlying == .seconds(86_400))
    }
}

extension `Duration preserves its carrier representation`.`Duration participates in generic carrier APIs` {

    @Test
    func `Duration satisfies some Carrier<Duration>`() {
        let v: Duration = .seconds(2)
        #expect(Fixture.value(of: v) == .seconds(2))
    }
}
