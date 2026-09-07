import Carrier
import Testing

@Suite
struct `Carrier permits domain specific namespace extensions` {
    @Test
    func `the namespace supports domain-specific extensions`() {
        #expect(MemoryLayout<Carrier.Fixture>.size == 0)
    }
}

extension Carrier {
    fileprivate enum Fixture {}
}
