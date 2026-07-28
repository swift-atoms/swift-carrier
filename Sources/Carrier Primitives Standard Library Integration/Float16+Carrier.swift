public import Carrier_Primitives

// MARK: - Float16 Conformance (Platform-Conditional)

// swiftlint:disable:next l1_no_platform_conditionals - reason: Float16 is unavailable on macOS x86_64; the conformance cannot compile where the type itself does not exist. A universal macOS build (`-destination 'generic/platform=macOS'`) compiles the x86_64 slice and fails without this guard.
#if os(iOS) || os(tvOS) || os(watchOS) || os(visionOS) || ((os(macOS) || targetEnvironment(macCatalyst)) && arch(arm64))
    extension Float16: Carrier.`Protocol` {
        /// The Underlying type for the Carrier conformance.
        public typealias Underlying = Float16
    }
#endif
