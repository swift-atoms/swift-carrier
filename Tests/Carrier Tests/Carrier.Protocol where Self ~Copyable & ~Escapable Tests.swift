import Carrier_Test_Support
import Testing

@Suite
struct `Carrier initialization preserves validation and capability constraints` {
    @Suite struct `Validated carriers construct copyable noncopyable and nonescapable values` {}
    @Suite struct `Carrier validation failures propagate their typed errors` {}
    @Suite struct `No validated carrier integration cases are defined` {}
    @Suite(.serialized) struct `No validated carrier performance cases are defined` {}
}

enum Validation: Swift.Error, Sendable {
    case rejected
}

extension `Carrier initialization preserves validation and capability constraints`.`Validated carriers construct copyable noncopyable and nonescapable values` {

    @Test
    func `Q1 validation-pass constructs Plain via default throwing init`() throws(Validation) {
        let c = try Fixture.Plain(42) { v in
            #expect(v == 42)
        }
        #expect(c.underlying == 42)
    }

    @Test
    func `Q2 validation-pass constructs Unique via default throwing init`() throws(Validation) {
        let resource = Fixture.Unique.Resource(raw: 7)
        let u = try Fixture.Unique(resource) { _ in

        }
        #expect(u.underlying.raw == 7)
    }

    @Test
    func `Q4 validation-pass constructs Scoped via default throwing init`() throws(Validation) {
        let resource = Fixture.Scoped.Resource(raw: 11)
        let s = try Fixture.Scoped(resource) { _ in }
        #expect(s.underlying.raw == 11)
    }
}

extension `Carrier initialization preserves validation and capability constraints`.`Carrier validation failures propagate their typed errors` {

    @Test
    func `Q1 validation-fail throws closure's typed error`() {
        #expect(throws: Validation.rejected) {
            try Fixture.Plain(0) { v throws(Validation) in
                if v == 0 { throw .rejected }
            }
        }
    }

    @Test
    func `Q2 validation-fail throws closure's typed error`() {
        #expect(throws: Validation.rejected) {
            let resource = Fixture.Unique.Resource(raw: 0)
            _ = try Fixture.Unique(resource) {
                (v: borrowing Fixture.Unique.Resource) throws(Validation) in
                if v.raw == 0 { throw .rejected }
            }
        }
    }

    @Test
    func `Q4 validation-fail throws closure's typed error`() {
        #expect(throws: Validation.rejected) {
            let resource = Fixture.Scoped.Resource(raw: 0)
            _ = try Fixture.Scoped(resource) {
                (v: borrowing Fixture.Scoped.Resource) throws(Validation) in
                if v.raw == 0 { throw .rejected }
            }
        }
    }
}
