// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "EffectOneKit",
  platforms: [.iOS(.v13)],
  products: [
    .library(name: "EffectOneKit", targets: ["EffectOneKit"]),
  ],
  targets: [
    .binaryTarget(
        name: "EffectOneKit",
        url: "https://sf3-ttcdn-tos.pstatp.com/obj/volcengine/EffectOneKit/0.2.0-EO/EffectOneKit.xcframework.zip",
        checksum: "e215bc1b4e8e7c9354e519f4a34276189e2a147f8cb0d93256b1702db60ca249"),
  ]
)
