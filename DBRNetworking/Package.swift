// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "DBRNetworking",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "DBRNetworking",
            targets: ["DBRNetworking"]),
    ],
    dependencies: [
        .package(url: "https://github.com/SimplyDanny/SwiftLintPlugins", from: "0.58.0")
    ],
    targets: [
        .target(
            name: "DBRNetworking",
            plugins: [
                .plugin(name: "SwiftLintBuildToolPlugin", package: "SwiftLintPlugins")
            ]
        )
    ]
)
