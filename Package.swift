// swift-tools-version:5.3
import PackageDescription
let package = Package(
    name: "Portfolio",
    platforms: [.macOS(.v11)],
    products: [
        .executable(name: "Portfolio", targets: ["Portfolio"])
    ],
    dependencies: [
        .package(name: "Tokamak", url: "https://github.com/TokamakUI/Tokamak", from: "0.9.0")
    ],
    targets: [
        .target(
            name: "Portfolio",
            dependencies: [
                .product(name: "TokamakShim", package: "Tokamak")
            ]),
        .testTarget(
            name: "PortfolioTests",
            dependencies: ["Portfolio"]),
    ]
)