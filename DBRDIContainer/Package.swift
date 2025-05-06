// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "DBRDIContainer",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "DBRDIContainer",
            targets: ["DBRDIContainer"]),
    ],
    dependencies: [
        .package(url: "https://github.com/hmlongco/Factory", from: "2.4.0"),
        .package(path: "../DBRCore"),
        .package(path: "../DBRNetworking"),
        .package(path: "../DBRAPIService")
    ],
    targets: [
        .target(
            name: "DBRDIContainer",
            dependencies: [
                "DBRCore",
                "DBRNetworking",
                "DBRAPIService"
            ],
            plugins: [
                .plugin(name: "Factory", package: "Factory")
            ]
        )
    ]
)
