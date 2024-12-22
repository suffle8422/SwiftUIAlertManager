// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftUIAlertManager",
    platforms: [.iOS(.v17)],
    dependencies: []
)

package.products = [
    .library(
        name: "SwiftUIAlertManager",
        targets: ["AlertManager"]
    )
]

package.targets = [
    .target(name: "AlertManager"),
]
