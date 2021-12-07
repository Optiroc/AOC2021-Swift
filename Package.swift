// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AOC2021",
    products: [
        .library(name: "AOC2021", targets: ["AOC2021"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-algorithms", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "AOC2021",
            dependencies: [
                .product(name: "Algorithms", package: "swift-algorithms"),
            ]
        ),
        .testTarget(
            name: "AOC2021Tests",
            dependencies: ["AOC2021"],
            resources: [
                .process("Data"),
            ]
        ),
    ]
)
