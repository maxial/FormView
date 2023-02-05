// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FormView",
    platforms: [
        .macOS(.v12), .iOS(.v15)
    ],
    products: [
        .library(
            name: "FormView",
            targets: ["FormView"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "FormView",
            dependencies: []),
        .testTarget(
            name: "FormViewTests",
            dependencies: ["FormView"]),
    ]
)
