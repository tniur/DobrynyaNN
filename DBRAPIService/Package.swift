// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "DBRAPIService",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "DBRAPIService",
            targets: ["DBRAPIService"]),
    ],
    dependencies: [
        .package(url: "https://github.com/SimplyDanny/SwiftLintPlugins", from: "0.58.0"),
        .package(path: "../DBRCore"),
        .package(path: "../DBRNetworking")
    ],
    targets: [
        .target(
            name: "DBRAPIService",
            dependencies: ["DBRCore", "DBRNetworking"],
            plugins: [
                .plugin(name: "SwiftLintBuildToolPlugin", package: "SwiftLintPlugins")
            ]
        )
    ]
)
