import Carrier
import Carrier_Test_Support
import Testing

@Suite
struct `Carrier.Protocol where Underlying == Self Tests` {
    @Suite struct Unit {}
    @Suite struct `Edge Case` {}
    @Suite struct Integration {}
    @Suite(.serialized) struct Performance {}
}

private struct Cardinal: Carrier.`Protocol` {
    var raw: Int
}

extension Cardinal {
    typealias Underlying = Self
}

extension `Carrier.Protocol where Underlying == Self Tests`.Unit {

    @Test
    func `default extension provides underlying for trivial self-carrier`() {
        let c = Cardinal(raw: 21)
        #expect(c.underlying.raw == 21)
    }

    @Test
    func `default extension provides init for trivial self-carrier`() {
        let original = Cardinal(raw: 42)
        let rebuilt = Cardinal(original)
        #expect(rebuilt.raw == 42)
    }

    @Test
    func `default extension round-trips through underlying and init`() {
        let original = Cardinal(raw: 99)
        let rebuilt = Cardinal(original.underlying)
        #expect(rebuilt.raw == 99)
    }
}

extension `Carrier.Protocol where Underlying == Self Tests`.Integration {

    @Test
    func `synthetic trivial conformer reaches some Carrier<U> API`() {

        let c = Cardinal(raw: 7)
        #expect(Fixture.value(of: c).raw == 7)
    }
}
