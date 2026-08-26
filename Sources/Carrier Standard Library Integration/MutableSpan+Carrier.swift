public import Carrier

extension MutableSpan: Carrier.`Protocol` {

    public typealias Underlying = MutableSpan<Element>

}
