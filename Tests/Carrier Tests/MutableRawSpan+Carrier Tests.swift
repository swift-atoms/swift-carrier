import Carrier_Test_Support
import Testing

@Suite
struct `MutableRawSpan+Carrier Tests` {
    @Suite struct Unit {}
    @Suite struct `Edge Case` {}
    @Suite struct Integration {}
    @Suite(.serialized) struct Performance {}
}

extension `MutableRawSpan+Carrier Tests`.Unit {

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

extension `MutableRawSpan+Carrier Tests`.`Edge Case` {

    @Test
    func `MutableRawSpan conforms at the type level`() {
        let conforms = Fixture.isCarrier(MutableRawSpan.self)
        #expect(conforms)
    }
}
