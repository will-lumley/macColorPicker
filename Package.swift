// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ColorPicker",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "ColorPicker",
            targets: ["ColorPicker"]),
    ],
    dependencies: [

    ],
    targets: [
        
    ]
)

let package = Package(
    name: "ColorPicker",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "ColorPicker",
            targets: ["ColorPicker"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "ColorPicker",
            dependencies: []),
        .testTarget(
            name: "ColorPickerTests",
            dependencies: ["ColorPicker"]),
    ]
)
