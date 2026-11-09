import Carrier
import Carrier_Test_Support
import Testing

enum `Carrier.Bitwise.Protocol Tests` {}

extension `Carrier.Bitwise.Protocol Tests` {
    @Suite
    struct `Bitwise operators are opt-in and compute on the underlying value` {}
}

extension `Carrier.Bitwise.Protocol Tests` {

    struct Mask: Carrier.Bitwise.`Protocol` {
        let underlying: UInt8

        init(_ underlying: UInt8) {
            self.underlying = underlying
        }
    }

    struct Overriding: Carrier.Bitwise.`Protocol` {
        let underlying: UInt8

        init(_ underlying: UInt8) {
            self.underlying = underlying
        }

        static func & (lhs: Self, rhs: Self) -> Self {
            Self(0xAA)
        }
    }

    static func hasBitwiseOperators<C: Carrier.`Protocol`>(_: C.Type) -> Bool {
        false
    }

    static func hasBitwiseOperators<C: Carrier.Bitwise.`Protocol`>(_: C.Type) -> Bool {
        true
    }
}

extension `Carrier.Bitwise.Protocol Tests`.`Bitwise operators are opt-in and compute on the underlying value` {
    typealias Mask = `Carrier.Bitwise.Protocol Tests`.Mask
    typealias Overriding = `Carrier.Bitwise.Protocol Tests`.Overriding

    @Test
    func `a carrier that only conforms to Carrier.Protocol does not get the operators`() {
        #expect(!`Carrier.Bitwise.Protocol Tests`.hasBitwiseOperators(Fixture.Plain.self))
        #expect(`Carrier.Bitwise.Protocol Tests`.hasBitwiseOperators(Mask.self))
    }

    @Test
    func `binary and prefix operators compute on the underlying values`() {
        let a = Mask(0b1100)
        let b = Mask(0b1010)
        #expect((a & b).underlying == 0b1000)
        #expect((a | b).underlying == 0b1110)
        #expect((a ^ b).underlying == 0b0110)
        #expect((~a).underlying == 0b1111_0011)
        #expect((a << 2).underlying == 0b11_0000)
        #expect((a >> 2).underlying == 0b11)
        #expect((a << 9).underlying == 0)
    }

    @Test
    func `compound assignments match the binary operators`() {
        var m = Mask(0b1100)
        m &= Mask(0b1010)
        #expect(m.underlying == 0b1000)
        m |= Mask(0b0001)
        #expect(m.underlying == 0b1001)
        m ^= Mask(0b1111)
        #expect(m.underlying == 0b0110)
        m <<= 1
        #expect(m.underlying == 0b1100)
        m >>= 2
        #expect(m.underlying == 0b11)
    }

    @Test
    func `an operator declared on the concrete type takes precedence`() {
        #expect((Overriding(0x0F) & Overriding(0xF0)).underlying == 0xAA)
        #expect((Overriding(0x0F) | Overriding(0xF0)).underlying == 0xFF)
    }

    @Test
    func `isZero and isNonZero compare the underlying value with zero`() {
        #expect(Fixture.Plain(0).isZero)
        #expect(!Fixture.Plain(0).isNonZero)
        #expect(Mask(1).isNonZero)
        #expect(!Mask(1).isZero)
    }
}
