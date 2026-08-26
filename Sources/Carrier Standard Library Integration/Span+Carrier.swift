public import Carrier

extension Span: Carrier.`Protocol` {

    public typealias Underlying = Swift.Span<Element>

}
