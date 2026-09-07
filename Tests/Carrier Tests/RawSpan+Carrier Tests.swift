import Carrier_Test_Support
import Testing

@Suite
struct `RawSpan preserves its carrier representation` {
    @Suite struct `RawSpan lends its underlying carrier representation` {}
    @Suite struct `RawSpan preserves buffers and satisfies carrier constraints` {}
    @Suite struct `No RawSpan carrier integration cases are defined` {}
    @Suite(.serialized) struct `No RawSpan carrier performance cases are defined` {}
}

extension `RawSpan preserves its carrier representation`.`RawSpan lends its underlying carrier representation` {

    @Test
    func `RawSpan underlying yields self via _read coroutine`() {
        let bytes: [UInt8] = [1, 2, 3, 4]
        unsafe bytes.withUnsafeBufferPointer { buffer in
            let span = unsafe Span<UInt8>(_unsafeElements: buffer)
            let raw = RawSpan(_elements: span)
            #expect(raw.underlying.byteCount == 4)
        }
    }
}

extension `RawSpan preserves its carrier representation`.`RawSpan preserves buffers and satisfies carrier constraints` {

    @Test
    func `RawSpan conforms at the type level`() {
        let conforms = Fixture.isCarrier(RawSpan.self)
        #expect(conforms)
    }

    @Test
    func `RawSpan underlying preserves empty buffer`() {
        let bytes: [UInt8] = []
        unsafe bytes.withUnsafeBufferPointer { buffer in
            let span = unsafe Span<UInt8>(_unsafeElements: buffer)
            let raw = RawSpan(_elements: span)
            #expect(raw.underlying.byteCount == 0)
        }
    }
}
