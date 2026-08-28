@_disfavoredOverload
@inlinable
public func & <C: Carrier.`Protocol`>(lhs: C, rhs: C) -> C
where C.Underlying: FixedWidthInteger {
    C(lhs.underlying & rhs.underlying)
}

@_disfavoredOverload
@inlinable
public func | <C: Carrier.`Protocol`>(lhs: C, rhs: C) -> C
where C.Underlying: FixedWidthInteger {
    C(lhs.underlying | rhs.underlying)
}

@_disfavoredOverload
@inlinable
public func ^ <C: Carrier.`Protocol`>(lhs: C, rhs: C) -> C
where C.Underlying: FixedWidthInteger {
    C(lhs.underlying ^ rhs.underlying)
}

@_disfavoredOverload
@inlinable
public prefix func ~ <C: Carrier.`Protocol`>(value: C) -> C
where C.Underlying: FixedWidthInteger {
    C(~value.underlying)
}

@_disfavoredOverload
@inlinable
public func << <C: Carrier.`Protocol`>(lhs: C, rhs: Int) -> C
where C.Underlying: FixedWidthInteger {
    C(lhs.underlying << rhs)
}

@_disfavoredOverload
@inlinable
public func >> <C: Carrier.`Protocol`>(lhs: C, rhs: Int) -> C
where C.Underlying: FixedWidthInteger {
    C(lhs.underlying >> rhs)
}

@_disfavoredOverload
@inlinable
public func &= <C: Carrier.`Protocol`>(lhs: inout C, rhs: C)
where C.Underlying: FixedWidthInteger {
    lhs = lhs & rhs
}

@_disfavoredOverload
@inlinable
public func |= <C: Carrier.`Protocol`>(lhs: inout C, rhs: C)
where C.Underlying: FixedWidthInteger {
    lhs = lhs | rhs
}

@_disfavoredOverload
@inlinable
public func ^= <C: Carrier.`Protocol`>(lhs: inout C, rhs: C)
where C.Underlying: FixedWidthInteger {
    lhs = lhs ^ rhs
}

@_disfavoredOverload
@inlinable
public func <<= <C: Carrier.`Protocol`>(lhs: inout C, rhs: Int)
where C.Underlying: FixedWidthInteger {
    lhs = lhs << rhs
}

@_disfavoredOverload
@inlinable
public func >>= <C: Carrier.`Protocol`>(lhs: inout C, rhs: Int)
where C.Underlying: FixedWidthInteger {
    lhs = lhs >> rhs
}

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
