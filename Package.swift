// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "SwiftClockKit",
    platforms: [
        .iOS(.v14), // Or your desired minimum
        .macOS(.v11)
        // .watchOS(.v7)
    ],
    products: [
        .library(
            name: "SwiftClockKit",
            targets: ["SwiftClockKit"]),
        .executable(
            name: "ClockDemoApp", // Name your demo app executable
            targets: ["ClockDemoApp"]) // Target for the demo app
    ],
    targets: [
        .target(
            name: "SwiftClockKit", // Your library's code
            dependencies: []
            // `path` defaults to "Sources/SwiftClockKit"
        ),
        .executableTarget(
            name: "ClockDemoApp", // Your demo app's code
            dependencies: ["SwiftClockKit"] // Demo app depends on your library
            // `path` defaults to "Sources/ClockDemoApp"
        ),
        .testTarget(
            name: "SwiftClockKitTests",
            dependencies: ["SwiftClockKit"]),
    ]
)
