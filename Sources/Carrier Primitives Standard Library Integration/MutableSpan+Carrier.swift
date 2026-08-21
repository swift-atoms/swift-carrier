public import Carrier_Primitives

extension MutableSpan: Carrier.`Protocol` {

    public typealias Underlying = MutableSpan<Element>

}
