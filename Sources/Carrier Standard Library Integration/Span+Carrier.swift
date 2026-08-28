public import Carrier_Protocol

extension Span: Carrier.`Protocol` {

    public typealias Underlying = Swift.Span<Element>

}
