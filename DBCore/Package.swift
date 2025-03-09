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
        .package(path: "../DBNetworking"),
        .package(url: "https://github.com/SimplyDanny/SwiftLintPlugins", from: "0.58.0"),
        .package(url: "https://github.com/hmlongco/Factory", from: "2.4.0")
    ],
    targets: [
        .target(
            name: "DBCore",
            dependencies: [
                .product(name: "DBNetworking", package: "DBNetworking"),
            ],
            plugins: [
                .plugin(name: "SwiftLintBuildToolPlugin", package: "SwiftLintPlugins"),
                .plugin(name: "Factory", package: "Factory")
            ]
        )
    ]
    
)
