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
        .library(name: "Carrier", targets: ["Carrier"]),

        .library(name: "Carrier Foundation Integration", targets: ["Carrier Foundation Integration"]),
        .library(name: "Carrier Test Support", targets: ["Carrier Test Support"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Carrier",
            dependencies: [
            ],
            path: "Sources/Carrier"
        ),
        
        .target(
            name: "Carrier Foundation Integration",
            dependencies: [
                .target(name: "Carrier"),
            ],
            path: "Sources/Carrier Foundation Integration"
        ),
        .target(
            name: "Carrier Test Support",
            dependencies: [
                .target(name: "Carrier"),
            ],
            path: "Tests/Support"
        ),
        .testTarget(
            name: "Carrier Tests",
            dependencies: [
                .target(name: "Carrier"),
                .target(name: "Carrier Test Support"),
                .target(name: "Carrier Foundation Integration"),
            ],
            path: "Tests/Carrier Tests"
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets {
    target.swiftSettings = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]
}
