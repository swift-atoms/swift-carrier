import Carrier
import Carrier_Standard_Library_Integration
import Carrier_Test_Support
import Testing

@Suite
struct `MutableSpan+Carrier Tests` {
    @Suite struct Unit {}
    @Suite struct `Edge Case` {}
    @Suite struct Integration {}
    @Suite(.serialized) struct Performance {}
}

extension `MutableSpan+Carrier Tests`.Unit {

    @Test
    func `MutableSpan underlying yields self via _read coroutine`() {
        var bytes: [UInt8] = [10, 20, 30]
        unsafe bytes.withUnsafeMutableBufferPointer { buffer in
            let span = unsafe MutableSpan<UInt8>(_unsafeElements: buffer)
            #expect(span.underlying.count == 3)
        }
    }
}

extension `MutableSpan+Carrier Tests`.`Edge Case` {

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
