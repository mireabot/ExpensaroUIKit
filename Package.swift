// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "ExpensaroUIKit",
  platforms: [
    .iOS(.v16), // Set the minimum iOS version to 16 or higher
  ],
  products: [
    // Products define the executables and libraries a package produces, and make them visible to other packages.
    .library(
      name: "ExpensaroUIKit",
      targets: ["ExpensaroUIKit"]),
  ],
  dependencies: [
    // Dependencies declare other packages that this package depends on.
    // .package(url: /* package url */, from: "1.0.0"),
  ],
  targets: [
    // Targets are the basic building blocks of a package. A target can define a module or a test suite.
    // Targets can depend on other targets in this package, and on products in packages this package depends on.
    .target(
      name: "ExpensaroUIKit",
      dependencies: [],
      resources: [
        .process("Resources/Fonts")
      ]),
    .testTarget(
      name: "ExpensaroUIKitTests",
      dependencies: ["ExpensaroUIKit"]),
  ]
)
