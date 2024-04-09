//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by Katherine JANG on 4/8/24.
//


import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.framework(
	name: Module.calendar.name,
	dependencies: [
		.project(target: "Utils", path: "../Utils"),
		.project(target: "Network", path: "../Network")
	],
	resources: .default
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
