import Carrier_Test_Support
import Testing

@Suite
struct `MutableSpan preserves its carrier representation` {
    @Suite struct `MutableSpan lends its underlying carrier representation` {}
    @Suite struct `MutableSpan preserves buffers and satisfies carrier constraints` {}
    @Suite struct `No MutableSpan carrier integration cases are defined` {}
    @Suite(.serialized) struct `No MutableSpan carrier performance cases are defined` {}
}

extension `MutableSpan preserves its carrier representation`.`MutableSpan lends its underlying carrier representation` {

    @Test
    func `MutableSpan underlying yields self via _read coroutine`() {
        var bytes: [UInt8] = [10, 20, 30]
        unsafe bytes.withUnsafeMutableBufferPointer { buffer in
            let span = unsafe MutableSpan<UInt8>(_unsafeElements: buffer)
            #expect(span.underlying.count == 3)
        }
    }
}

extension `MutableSpan preserves its carrier representation`.`MutableSpan preserves buffers and satisfies carrier constraints` {

    @Test
    func `MutableSpan<UInt8> conforms at the type level`() {
        let conforms = Fixture.isCarrier(MutableSpan<UInt8>.self)
        #expect(conforms)
    }

    @Test
    func `MutableSpan underlying preserves empty buffer`() {
        var bytes: [UInt8] = []
        unsafe bytes.withUnsafeMutableBufferPointer { buffer in
            let span = unsafe MutableSpan<UInt8>(_unsafeElements: buffer)
            let isEmpty = span.underlying.isEmpty
            #expect(isEmpty)
        }
    }
}
