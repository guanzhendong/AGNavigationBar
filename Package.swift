// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AGNavigationBar",
    platforms: [.iOS(.v10)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "AGNavigationBar",
            targets: ["AGNavigationBar"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "AGNavigationBar",
            path: "AGNavigationBar/Classes"),
        .testTarget(
            name: "AGNavigationBarTests",
            dependencies: ["AGNavigationBar"]),
    ],
    swiftLanguageVersions: [.v5]
)
