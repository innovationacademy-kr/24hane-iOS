//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by Katherine JANG on 4/8/24.
//


import ProjectDescription
import ProjectDescriptionHelpers

//let project = Project.appExtension(name: "HANE24Widget", dependencies: [ Module.network.project])

let project = Project(
	name: Module.widget.name,
	targets: [
		Target(
			name: Module.widget.name,
			platform: .iOS,
			product: .appExtension,
			bundleId: bundleID + ".widgetExtension"
		)
	]
)
