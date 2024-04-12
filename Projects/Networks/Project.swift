//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by Hosung Lim on 4/9/24.
//

import ProjectDescription
import ProjectDescriptionHelpers

//let project = Project.makeFramework(name: Module.network.name)
let project = Project(
	name: Module.network.name,
	targets: [
		Target(
			name: Module.network.name,
			platform: .iOS,
			product: .framework,
			bundleId: bundleID,
			sources: [
				"Sources/**"
			]
		)
	]
)
