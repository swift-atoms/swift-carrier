extension Carrier.Bitwise {

    public protocol `Protocol`: Carrier.`Protocol` where Underlying: FixedWidthInteger {}
}

extension Carrier.Bitwise.`Protocol` {

    @_disfavoredOverload
    @inlinable
    public static func & (lhs: Self, rhs: Self) -> Self {
        Self(lhs.underlying & rhs.underlying)
    }

    @_disfavoredOverload
    @inlinable
    public static func | (lhs: Self, rhs: Self) -> Self {
        Self(lhs.underlying | rhs.underlying)
    }

    @_disfavoredOverload
    @inlinable
    public static func ^ (lhs: Self, rhs: Self) -> Self {
        Self(lhs.underlying ^ rhs.underlying)
    }

    @_disfavoredOverload
    @inlinable
    public static prefix func ~ (value: Self) -> Self {
        Self(~value.underlying)
    }

    @_disfavoredOverload
    @inlinable
    public static func << (lhs: Self, rhs: Int) -> Self {
        Self(lhs.underlying << rhs)
    }

    @_disfavoredOverload
    @inlinable
    public static func >> (lhs: Self, rhs: Int) -> Self {
        Self(lhs.underlying >> rhs)
    }

    @_disfavoredOverload
    @inlinable
    public static func &= (lhs: inout Self, rhs: Self) {
        lhs = lhs & rhs
    }

    @_disfavoredOverload
    @inlinable
    public static func |= (lhs: inout Self, rhs: Self) {
        lhs = lhs | rhs
    }

    @_disfavoredOverload
    @inlinable
    public static func ^= (lhs: inout Self, rhs: Self) {
        lhs = lhs ^ rhs
    }

    @_disfavoredOverload
    @inlinable
    public static func <<= (lhs: inout Self, rhs: Int) {
        lhs = lhs << rhs
    }

    @_disfavoredOverload
    @inlinable
    public static func >>= (lhs: inout Self, rhs: Int) {
        lhs = lhs >> rhs
    }
}
