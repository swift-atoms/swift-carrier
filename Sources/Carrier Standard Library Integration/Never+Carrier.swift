public import Carrier

extension Never: Carrier.`Protocol` {

    public typealias Underlying = Never
}
