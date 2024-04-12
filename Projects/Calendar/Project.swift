//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by Katherine JANG on 4/8/24.
//


import ProjectDescription
import ProjectDescriptionHelpers

//let project = Project.makeFramework(
//	name: Module.calendar.name,
//	dependencies: [
//		Project.app(
//			name: "App",
//			dependencies: [
//				.project(target: "Utils", path: "../Utils"),
//				.project(target: "Networks", path: "../Networks")
//			],
//			resources: "./**"
//		),
//		.project(target: "Utils", path: "../Utils"),
//		.project(target: "Networks", path: "../Networks")
//	],
//	resources: .default
//)

let project = Project(
	name: Module.calendar.name,
	targets: [
		// 실제 코드
		Target(
			name: "\(Module.calendar.name)",
			platform: .iOS,
			product: .framework,
			bundleId: "\(bundleID)",
			infoPlist: .file(path: .relativeToRoot("HANE24/Info.plist")),
			sources: ["Sources/**"],
			dependencies: [
				.project(target: "Utils", path: "../Utils"),
				.project(target: "Networks", path: "../Networks")
			]
		),
		// 데모 앱
		Target(
			name: "CalendarDemo",
			platform: .iOS,
			product: .app,
			bundleId: "\(bundleID).\(Module.calendar.name).Demo",
			infoPlist: .file(path: .relativeToRoot("HANE24/Info.plist")),
			sources: ["Demo/Sources/**"],
			dependencies: [
				.target(name: "\(Module.calendar.name)"),
				.project(target: "Utils", path: "../Utils"),
				.project(target: "Networks", path: "../Networks")
			]
		),
		// 테스트
		Target(
			name: "Tests",
			platform: .iOS,
			product: .unitTests,
			bundleId: "\(bundleID).\(Module.calendar.name).Tests",
			infoPlist: .file(path: .relativeToRoot("HANE24/Info.plist")),
			sources: ["Tests/**"],
			dependencies: [
				.target(name: "\(Module.calendar.name)")
			]
		)
	]
)

/**

 settings: .settings(
 base: [
 "MARKETING_VERSION": "1.0", // 버전
 "CURRENT_PROJECT_VERSION": "1", // 빌드
 "OTHER_SWIFT_FLAGS":"-D SIMUL",
 ],
 configurations: [],
 defaultSettings: .recommended
 )
 */
