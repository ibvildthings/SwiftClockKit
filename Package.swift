// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "SwiftClockKit",
    platforms: [
        .iOS(.v17),
        .macOS(.v11)
    ],
    products: [
        .library(
            name: "SwiftClockKit",
            targets: ["SwiftClockKit"]
        ),
    ],
    targets: [
        .target(
            name: "SwiftClockKit",
            dependencies: []
        ),
        .testTarget(
            name: "SwiftClockKitTests",
            dependencies: ["SwiftClockKit"]
        ),
    ]
)
