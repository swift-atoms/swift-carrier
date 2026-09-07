public import Carrier

extension StaticString: Carrier.`Protocol` {

    public typealias Underlying = StaticString
}
