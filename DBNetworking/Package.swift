// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "DBNetworking",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "DBNetworking",
            targets: ["DBNetworking"]),
    ],
    dependencies: [
        .package(url: "https://github.com/SimplyDanny/SwiftLintPlugins", from: "0.58.0")
    ],
    targets: [
        .target(
            name: "DBNetworking",
            plugins: [
                .plugin(name: "SwiftLintBuildToolPlugin", package: "SwiftLintPlugins")
            ]
        )
    ]
    
)
