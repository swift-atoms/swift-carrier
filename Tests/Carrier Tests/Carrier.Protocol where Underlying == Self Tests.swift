import Carrier_Test_Support
import Testing

@Suite
struct `Self carriers receive default conversion operations` {
    @Suite struct `Self carrier defaults preserve construction and underlying values` {}
    @Suite struct `No self carrier boundary cases are defined` {}
    @Suite struct `Self carriers satisfy generic underlying type constraints` {}
    @Suite(.serialized) struct `No self carrier performance cases are defined` {}
}

private struct Cardinal: Carrier.`Protocol` {
    var raw: Int
}

extension Cardinal {
    typealias Underlying = Self
}

extension `Self carriers receive default conversion operations`.`Self carrier defaults preserve construction and underlying values` {

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

extension `Self carriers receive default conversion operations`.`Self carriers satisfy generic underlying type constraints` {

    @Test
    func `synthetic trivial conformer reaches some Carrier<U> API`() {

        let c = Cardinal(raw: 7)
        #expect(Fixture.value(of: c).raw == 7)
    }
}
