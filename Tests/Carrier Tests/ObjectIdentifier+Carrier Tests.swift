import Carrier_Test_Support
import Testing

@Suite
struct `ObjectIdentifier preserves its carrier representation` {
    @Suite struct `ObjectIdentifier carrier conversion round trips through its underlying value` {}
    @Suite struct `ObjectIdentifier carrier values distinguish separate instances` {}
    @Suite struct `ObjectIdentifier participates in generic carrier APIs` {}
    @Suite(.serialized) struct `No ObjectIdentifier carrier performance cases are defined` {}
}

private final class Token {}

extension `ObjectIdentifier preserves its carrier representation`.`ObjectIdentifier carrier conversion round trips through its underlying value` {

    @Test
    func `ObjectIdentifier round-trips via underlying`() {
        let token = Token()
        let v = ObjectIdentifier(token)
        #expect(v.underlying == ObjectIdentifier(token))
    }

    @Test
    func `ObjectIdentifier round-trips via init from underlying`() {
        let token = Token()
        let v = ObjectIdentifier(token)
        #expect(ObjectIdentifier(v.underlying) == ObjectIdentifier(token))
    }
}

extension `ObjectIdentifier preserves its carrier representation`.`ObjectIdentifier carrier values distinguish separate instances` {

    @Test
    func `ObjectIdentifier distinguishes distinct instances`() {
        let a = Token()
        let b = Token()
        let idA = ObjectIdentifier(a)
        let idB = ObjectIdentifier(b)
        #expect(idA.underlying != idB.underlying)
    }
}

extension `ObjectIdentifier preserves its carrier representation`.`ObjectIdentifier participates in generic carrier APIs` {

    @Test
    func `ObjectIdentifier satisfies some Carrier<ObjectIdentifier>`() {
        let token = Token()
        let v = ObjectIdentifier(token)
        #expect(Fixture.value(of: v) == ObjectIdentifier(token))
    }
}
