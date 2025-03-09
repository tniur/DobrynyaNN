// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "DBUtils",
    defaultLocalization: "ru",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "DBUtils",
            targets: ["DBUtils"]),
    ],
    dependencies: [
        .package(url: "https://github.com/SimplyDanny/SwiftLintPlugins", from: "0.58.0")
    ],
    targets: [
        .target(
            name: "DBUtils",
            plugins: [
                .plugin(name: "SwiftLintBuildToolPlugin", package: "SwiftLintPlugins")
            ]
        )
    ]
    
)
