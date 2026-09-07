import Carrier_Test_Support
import Testing

@Suite
struct `Unicode.Scalar preserves its carrier representation` {
    @Suite struct `Unicode.Scalar carrier conversion round trips through its underlying value` {}
    @Suite struct `Unicode.Scalar carrier conversion preserves text boundaries and Unicode content` {}
    @Suite struct `Unicode.Scalar participates in generic carrier APIs` {}
    @Suite(.serialized) struct `No Unicode.Scalar carrier performance cases are defined` {}
}

extension `Unicode.Scalar preserves its carrier representation`.`Unicode.Scalar carrier conversion round trips through its underlying value` {

    @Test
    func `Unicode_Scalar round-trips via underlying`() {
        let v: Unicode.Scalar = "A"
        #expect(v.underlying == "A")
    }

    @Test
    func `Unicode_Scalar round-trips via init from underlying`() {
        let v: Unicode.Scalar = "Z"
        #expect(Unicode.Scalar(v.underlying) == "Z")
    }
}

extension `Unicode.Scalar preserves its carrier representation`.`Unicode.Scalar carrier conversion preserves text boundaries and Unicode content` {

    @Test
    func `Unicode_Scalar handles ASCII zero`() {
        let v: Unicode.Scalar = Unicode.Scalar(0)
        #expect(v.underlying.value == 0)
    }

    @Test
    func `Unicode_Scalar handles BMP boundary (0xFFFF)`() {
        let v: Unicode.Scalar = Unicode.Scalar(0xFFFF)!
        #expect(v.underlying.value == 0xFFFF)
    }

    @Test
    func `Unicode_Scalar handles supplementary plane (emoji)`() {
        let v: Unicode.Scalar = Unicode.Scalar(0x1F30D)!
        #expect(v.underlying.value == 0x1F30D)
    }

    @Test
    func `Unicode_Scalar handles maximum valid scalar (0x10FFFF)`() {
        let v: Unicode.Scalar = Unicode.Scalar(0x10FFFF)!
        #expect(v.underlying.value == 0x10FFFF)
    }
}

extension `Unicode.Scalar preserves its carrier representation`.`Unicode.Scalar participates in generic carrier APIs` {

    @Test
    func `Unicode_Scalar satisfies some Carrier<Unicode_Scalar>`() {
        let v: Unicode.Scalar = "Q"
        #expect(Fixture.value(of: v) == "Q")
    }
}
