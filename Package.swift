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
			name: "SharingExtensions",
			targets: ["SharingExtensions"]
		),
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
			url: "https://github.com/capturecontext/swift-casification.git",
			.upToNextMinor(from: "0.0.1")
		),
	],
	targets: [
		.target(
			name: "SharingExtensions",
			dependencies: [
				.target(
					name: "SharingKeys",
					condition: nil
				),
			]
		),
		.target(
			name: "SharingKeys",
			dependencies: [
				.target(
					name: "SharingKeysCore",
					condition: nil
				),
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
				.target(
					name: "SharingKeysCore",
					condition: nil
				),
			],
			path: "Tests/_SharingKeysTesting"
		),
		.testTarget(
			name: "SharingKeysTests",
			dependencies: [
				.target(
					name: "SharingKeys",
					condition: nil
				),
				.target(
					name: "_SharingKeysTesting",
					condition: nil
				),
			]
		),
		.testTarget(
			name: "SharingKeysCoreTests",
			dependencies: [
				.target(
					name: "SharingKeysCore",
					condition: nil
				),
				.target(
					name: "_SharingKeysTesting",
					condition: nil
				),
			]
		),
	]
)
