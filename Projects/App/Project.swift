//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by Katherine JANG on 4/8/24.
//

import ProjectDescription
import ProjectDescriptionHelpers

//let project = Project.app(
//	name: Module.app.name,
//	dependencies: [
//		Module.home.project,
//		Module.network.project,
//		.target(name: "HANE24Widget")
//	],
//	resources: .default
//)

let project = Project(
	name: Module.app.name,
	targets: [
		Target(
			name: Module.app.name,
			platform: .iOS,
			product: .app,
			bundleId: bundleID,
			deploymentTarget:
					.iOS(targetVersion: "15.0", devices: [.iphone]),
			infoPlist: .file(path: .relativeToRoot("HANE24/Info.plist")),
			sources: ["Sources/**"],
			dependencies: [
				.project(target: "Calendar", path: "../Calendar")
			]
		)
	]
)
