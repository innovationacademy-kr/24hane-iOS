//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by Katherine JANG on 4/8/24.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.app(
	name: Module.app.name,
	dependencies: [
		Module.home.project,
		Module.network.project,
		.target(name: "HANE24Widget")
	],
	resources: .default
)
