// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AutentikarUnifiedID",
    products: [
        .library(
            name: "AutentikarUnifiedID",
            targets: ["AutentikarUnifiedIDWrapper"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Autentikar/faceTec-dependency.git", from: "9.7.67"),
    ],
    targets: [
        .target(
            name: "AutentikarUnifiedIDWrapper",
            dependencies: [
                .product(name: "FaceTecSDK", package: "faceTec-dependency"),
                .target(name: "AutentikarUnifiedID"),
            ],
            path: "AutentikarUnifiedIDWrapper"
        ),
        .binaryTarget(
            name: "AutentikarUnifiedID",
            path: "AutentikarUnifiedID.xcframework")
    ]
)
