import Carrier_Test_Support
import Testing

@Suite
struct `MutableRawSpan preserves its carrier representation` {
    @Suite struct `MutableRawSpan lends its underlying carrier representation` {}
    @Suite struct `MutableRawSpan preserves buffers and satisfies carrier constraints` {}
    @Suite struct `No MutableRawSpan carrier integration cases are defined` {}
    @Suite(.serialized) struct `No MutableRawSpan carrier performance cases are defined` {}
}

extension `MutableRawSpan preserves its carrier representation`.`MutableRawSpan lends its underlying carrier representation` {

    @Test
    func `MutableRawSpan underlying yields self via _read coroutine`() {
        var bytes: [UInt8] = [1, 2, 3, 4]
        unsafe bytes.withUnsafeMutableBufferPointer { buffer in
            var span = unsafe MutableSpan<UInt8>(_unsafeElements: buffer)
            let raw = MutableRawSpan(_elements: &span)
            #expect(raw.underlying.byteCount == 4)
        }
    }
}

extension `MutableRawSpan preserves its carrier representation`.`MutableRawSpan preserves buffers and satisfies carrier constraints` {

    @Test
    func `MutableRawSpan conforms at the type level`() {
        let conforms = Fixture.isCarrier(MutableRawSpan.self)
        #expect(conforms)
    }
}
