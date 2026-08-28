public import Carrier_Protocol

extension StaticString: Carrier.`Protocol` {

    public typealias Underlying = StaticString
}
