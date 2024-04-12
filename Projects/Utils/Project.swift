//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by Hosung Lim on 4/9/24.
//

import ProjectDescription
import ProjectDescriptionHelpers
//
//let project = Project.makeFramework(
//	name: Module.utils.name,
//	dependencies: [
//	],
//	resources: .default
//)

let project = Project(
	name: Module.utils.name,
	targets: [
		Target(
			name: Module.utils.name,
			platform: .iOS,
			product: .framework,
			bundleId: bundleID,
			sources: ["Sources/**"]
		)
	]
)
