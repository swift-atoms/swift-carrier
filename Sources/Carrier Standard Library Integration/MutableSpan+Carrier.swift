public import Carrier_Protocol

extension MutableSpan: Carrier.`Protocol` {

    public typealias Underlying = MutableSpan<Element>

}
