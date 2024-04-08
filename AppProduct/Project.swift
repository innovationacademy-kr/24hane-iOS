//
//  Project.swift
//  _24hane-iOSManifests
//
//  Created by Hosung Lim on 4/8/24.
//

import ProjectDescription

// MARK: Constants
// App Infomation
let projectName = "HANE24-App"
let organizationName = "Hane24-iOS"
let bundleID = "net.hejang.-4HANE"
let sourse = "../HANE24"
let targetVersion = "15.0"

let appTarget = Target(
	name: projectName,
	platform: .iOS,
	product: .app,
	bundleId: bundleID,
	sources: ["\(sourse)/**"]
)

let appProject = Project(
	name: projectName,
	organizationName: organizationName,
	packages: [],
	settings: nil,
	targets: [
		appTarget,
	]
)
