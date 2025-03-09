// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "DBCore",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "DBCore",
            targets: ["DBCore"]),
    ],
    dependencies: [
        .package(url: "https://github.com/SimplyDanny/SwiftLintPlugins", from: "0.58.0")
    ],
    targets: [
        .target(
            name: "DBCore",
            plugins: [
                .plugin(name: "SwiftLintBuildToolPlugin", package: "SwiftLintPlugins")
            ]
        )
    ]
    
)
