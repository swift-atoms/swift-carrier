import Carrier
import Carrier_Standard_Library_Integration
import Carrier_Test_Support
import Testing

@Suite
struct `RawSpan+Carrier Tests` {
    @Suite struct Unit {}
    @Suite struct `Edge Case` {}
    @Suite struct Integration {}
    @Suite(.serialized) struct Performance {}
}

extension `RawSpan+Carrier Tests`.Unit {

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

extension `RawSpan+Carrier Tests`.`Edge Case` {

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
