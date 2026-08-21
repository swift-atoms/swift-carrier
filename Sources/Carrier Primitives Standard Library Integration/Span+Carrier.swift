public import Carrier_Primitives

extension Span: Carrier.`Protocol` {

    public typealias Underlying = Swift.Span<Element>

}
