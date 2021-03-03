// swift-tools-version:5.0
//
// HubjsTracker
//

import PackageDescription

let package = Package(
  name: "HubjsTracker",
  products: [
      .library(name: "HubjsTracker", targets: ["HubjsTracker"])
  ],
  targets: [
      .target(name: "HubjsTracker", dependencies: [], path: "HubjsTracker"),
  ],
  swiftLanguageVersions: [.v5]
)
