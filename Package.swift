// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import Foundation

let devMode = ProcessInfo.processInfo.environment["FACETEC_ENV"] == "dev"

let faceTecURL = devMode
    ? "https://github.com/Autentikar/facetec-development-dependency.git"
    : "https://github.com/Autentikar/faceTec-dependency.git"

let faceTecPackageName = devMode ? "facetec-development-dependency" : "faceTec-dependency"
let name = devMode ? "FaceTecSDKForDevelopment" : "FaceTecSDK"

let package = Package(
    name: "AutentikarUnifiedID",
    products: [
        .library(
            name: "AutentikarUnifiedID",
            targets: ["AutentikarUnifiedIDWrapper"]),
    ],
    dependencies: [
        .package(url: faceTecURL, from: "9.7.142"),
    ],
    targets: [
        .target(
            name: "AutentikarUnifiedIDWrapper",
            dependencies: [
                .product(name: name, package: faceTecPackageName),
                .target(name: "AutentikarUnifiedID"),
            ],
            path: "AutentikarUnifiedIDWrapper"
        ),
        .binaryTarget(
            name: "AutentikarUnifiedID",
            path: "AutentikarUnifiedID.xcframework")
    ]
)
