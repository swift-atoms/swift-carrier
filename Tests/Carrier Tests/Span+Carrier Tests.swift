import Carrier_Test_Support
import Testing

@Suite
struct `Span preserves its carrier representation` {
    @Suite struct `Span lends its underlying carrier representation` {}
    @Suite struct `Span preserves buffers and satisfies carrier constraints` {}
    @Suite struct `Span participates in generic carrier APIs` {}
    @Suite(.serialized) struct `No Span carrier performance cases are defined` {}
}

extension `Span preserves its carrier representation`.`Span lends its underlying carrier representation` {

    @Test
    func `Span underlying yields self via _read coroutine`() {

        let bytes: [UInt8] = [10, 20, 30]
        unsafe bytes.withUnsafeBufferPointer { buffer in
            let span = unsafe Span<UInt8>(_unsafeElements: buffer)
            #expect(span.underlying.count == 3)
        }
    }
}

extension `Span preserves its carrier representation`.`Span preserves buffers and satisfies carrier constraints` {

    @Test
    func `Span<UInt8> conforms at the type level`() {
        let conforms = Fixture.isCarrier(Span<UInt8>.self)
        #expect(conforms)
    }

    @Test
    func `Span underlying preserves empty buffer`() {
        let bytes: [UInt8] = []
        unsafe bytes.withUnsafeBufferPointer { buffer in
            let span = unsafe Span<UInt8>(_unsafeElements: buffer)
            let isEmpty = span.underlying.isEmpty
            #expect(isEmpty)
        }
    }

    @Test
    func `Span underlying preserves single-element buffer`() {
        let bytes: [UInt8] = [42]
        unsafe bytes.withUnsafeBufferPointer { buffer in
            let span = unsafe Span<UInt8>(_unsafeElements: buffer)
            #expect(span.underlying.count == 1)
        }
    }
}

extension `Span preserves its carrier representation`.`Span participates in generic carrier APIs` {

    @Test
    func `Span satisfies generic Carrier<Span<UInt8>> dispatch`() {
        let bytes: [UInt8] = [1, 2, 3, 4, 5]
        unsafe bytes.withUnsafeBufferPointer { buffer in
            let span = unsafe Span<UInt8>(_unsafeElements: buffer)

            func _count<C: Carrier.`Protocol` & ~Escapable>(
                _ c: borrowing C
            ) -> Int where C.Underlying == Span<UInt8> {
                c.underlying.count
            }
            #expect(_count(span) == 5)
        }
    }
}
