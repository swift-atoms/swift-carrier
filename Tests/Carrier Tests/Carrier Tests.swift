import Carrier
import Testing

enum `Carrier Tests` {}

extension `Carrier Tests` {
    @Suite
    struct `Carrier permits domain specific namespace extensions` {
        @Test
        func `the namespace supports domain-specific extensions`() {
            #expect(MemoryLayout<Carrier.Fixture>.size == 0)
        }
    }
}

extension Carrier {
    fileprivate enum Fixture {}
}
