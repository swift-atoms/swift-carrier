public import Carrier_Primitives

#if os(iOS) || os(tvOS) || os(watchOS) || os(visionOS) || ((os(macOS) || targetEnvironment(macCatalyst)) && arch(arm64))
    extension Float16: Carrier.`Protocol` {

        public typealias Underlying = Float16
    }
#endif
