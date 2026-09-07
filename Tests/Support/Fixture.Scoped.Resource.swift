extension Fixture.Scoped {

    public struct Resource: ~Copyable, ~Escapable {
        public var raw: Int

        public init(raw: Int) {
            self.raw = raw
        }
    }
}
