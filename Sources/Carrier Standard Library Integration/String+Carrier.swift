public import Carrier

extension String: Carrier.`Protocol` {

    public typealias Underlying = String
}
