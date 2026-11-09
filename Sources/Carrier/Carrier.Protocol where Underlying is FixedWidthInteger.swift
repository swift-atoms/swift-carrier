extension Carrier.`Protocol` where Underlying: FixedWidthInteger {

    @inlinable
    public var isNonZero: Bool {
        underlying != 0
    }

    @inlinable
    public var isZero: Bool {
        underlying == 0
    }
}
