import Carrier_Test_Support
import Testing

@Suite
struct `Character preserves its carrier representation` {
    @Suite struct `Character carrier conversion round trips through its underlying value` {}
    @Suite struct `Character carrier conversion preserves text boundaries and Unicode content` {}
    @Suite struct `Character participates in generic carrier APIs` {}
    @Suite(.serialized) struct `No Character carrier performance cases are defined` {}
}

extension `Character preserves its carrier representation`.`Character carrier conversion round trips through its underlying value` {

    @Test
    func `Character round-trips via underlying`() {
        let v: Character = "A"
        #expect(v.underlying == "A")
    }

    @Test
    func `Character round-trips via init from underlying`() {
        let v: Character = "Z"
        #expect(Character(v.underlying) == "Z")
    }
}

extension `Character preserves its carrier representation`.`Character carrier conversion preserves text boundaries and Unicode content` {

    @Test
    func `Character handles emoji grapheme cluster`() {
        let v: Character = "🌍"
        #expect(v.underlying == "🌍")
    }

    @Test
    func `Character handles combining scalars (single grapheme)`() {
        let v: Character = "é"
        #expect(v.underlying == "é")
    }

    @Test
    func `Character handles ZWJ family sequence`() {
        let v: Character = "👨‍👩‍👧"
        #expect(v.underlying == "👨‍👩‍👧")
    }
}

extension `Character preserves its carrier representation`.`Character participates in generic carrier APIs` {

    @Test
    func `Character satisfies some Carrier<Character>`() {
        #expect(Fixture.value(of: "Q" as Character) == "Q")
    }
}
