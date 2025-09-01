// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "iPhone",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v15),
        .macOS(.v12)
    ],
    products: [
        .library(
            name: "iPhoneCore",
            targets: ["iPhoneCore"]
        ),
    ],
    dependencies: [
        // Add your dependencies here
        // Example: .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.8.0"),
    ],
    targets: [
        .target(
            name: "iPhoneCore",
            dependencies: [],
            path: "Sources/Core"
        ),
        .testTarget(
            name: "iPhoneCoreTests",
            dependencies: ["iPhoneCore"],
            path: "Tests/UnitTests"
        ),
    ]
)