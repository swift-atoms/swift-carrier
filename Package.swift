// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-carrier",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(
            name: "Carrier",
            targets: ["Carrier"]
        ),
        .library(
            name: "Carrier Standard Library Integration",
            targets: ["Carrier Standard Library Integration"]
        ),
        .library(
            name: "Carrier Apple Foundation Integration",
            targets: ["Carrier Apple Foundation Integration"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Carrier",
            dependencies: []
        ),
        .target(
            name: "Carrier Standard Library Integration",
            dependencies: [
                "Carrier"
            ]
        ),
        .target(
            name: "Carrier Apple Foundation Integration",
            dependencies: [
                "Carrier",
                "Carrier Standard Library Integration",
            ]
        ),
        .target(
            name: "Carrier Test Support",
            dependencies: [
                "Carrier"
            ],
            path: "Tests/Support"
        ),
        .testTarget(
            name: "Carrier Tests",
            dependencies: [
                "Carrier",
                "Carrier Test Support",
            ]
        ),
        .testTarget(
            name: "Carrier Standard Library Integration Tests",
            dependencies: [
                "Carrier",
                "Carrier Standard Library Integration",
                "Carrier Test Support",
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
