// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "SwiftClockKit", // Package name
    platforms: [
        .iOS(.v15),
        .macOS(.v11)
        // .watchOS(.v7) // If you add watchOS support
    ],
    products: [
        // Product 1: The SwiftClockKit library
        .library(
            name: "SwiftClockKit",
            targets: ["SwiftClockKit"] // This product is built from the target named "SwiftClockKit"
        ),
    ],
    targets: [
        // Target 1: The source code FOR your SwiftClockKit library
        .target(
            name: "SwiftClockKit",    // <<<< CORRECTED NAME HERE
            dependencies: []
            // The source files for this target should be in "Sources/SwiftClockKit/"
        ),
        // Target 2: Your library's tests
        .testTarget(
            name: "SwiftClockKitTests",
            dependencies: ["SwiftClockKit"] // This depends on the "SwiftClockKit" target above
        ),
    ]
)
