//
//  Project.swift
//  _24hane-iOSManifests
//
//  Created by Hosung Lim on 4/8/24.
//

import ProjectDescription

// MARK: Constants

// Widget Infomation
let projectName = "HANE24-Widget"
let organizationName = "Hane24-iOS"
let widgetProjectName = "HANE24WidgetExtension"
let widgetBundleID = "net.hejang.-4HANE.HANE24Widget"
let widgetSourse = "../HANE24Widget"
let widgetTargetVersion = "17.0"

let widgetTarget = Target(
	name: widgetProjectName,
	platform: .iOS,
	product: .app,
	bundleId: widgetBundleID,
	sources: ["\(widgetSourse)/**"]
)

let widgetProject = Project(
	name: projectName,
	organizationName: organizationName,
	packages: [],
	settings: nil,
	targets: [
		widgetTarget
	]
)

