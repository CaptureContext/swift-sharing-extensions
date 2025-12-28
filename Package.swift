// swift-tools-version: 6.2

import PackageDescription

let package = Package(
	name: "swift-sharing-extensions",
	platforms: [
		.iOS(.v13),
		.macOS(.v10_15),
		.tvOS(.v13),
		.watchOS(.v6),
	],
	products: [
		.library(
			name: "SharingKeys",
			targets: ["SharingKeys"]
		),
		.library(
			name: "SharingKeysCore",
			targets: ["SharingKeysCore"]
		),
	],
	dependencies: [
		.package(
			url: "https://github.com/pointfreeco/swift-sharing.git",
			.upToNextMajor(from: "2.5.0")
		),
		.package(
			path: "../swift-casification",
			// url: "https://github.com/capturecontext/swift-casification.git",
			// .upToNextMinor(from: "0.0.1")
		),
	],
	targets: [
		.target(
			name: "SharingKeys",
			dependencies: [
				.target(name: "SharingKeysCore"),
				.product(
					name: "Sharing",
					package: "swift-sharing"
				),
			]
		),
		.target(
			name: "SharingKeysCore",
			dependencies: [
				.product(
					name: "Casification",
					package: "swift-casification"
				),
			]
		),
		.target(
			name: "_SharingKeysTesting",
			dependencies: [
				.target(name: "SharingKeysCore"),
			],
			path: "Tests/_SharingKeysTesting"
		),
		.testTarget(
			name: "SharingKeysTests",
			dependencies: [
				.target(name: "SharingKeys"),
				.target(name: "_SharingKeysTesting"),
			]
		),
		.testTarget(
			name: "SharingKeysCoreTests",
			dependencies: [
				.target(name: "SharingKeysCore"),
				.target(name: "_SharingKeysTesting"),
			]
		),
	]
)
