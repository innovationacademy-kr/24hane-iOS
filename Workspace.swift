//
//  Workspace.swift
//  tuistManifests
//
//  Created by Katherine JANG on 4/8/24.
//

import ProjectDescription
import ProjectDescriptionHelpers

let workspace = Workspace(
	name: "Projects",
	projects: Module.allCases.map(\.path),
	additionalFiles: []
)
