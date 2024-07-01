//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by Hosung Lim on 6/17/24.
//

import ProjectDescription

let bundleId = "net.hejang.-4hane.core"

let target: Target = .target(
    name: "HaneCore",
    destinations: .iOS,
    product: .framework,
    bundleId: bundleId,
    deploymentTargets: .iOS("15.0"),
//    infoPlist: .file(path: .relativeToRoot("Supports/Info.plist")),
    sources: "Sources/**",
    dependencies: []
)

let targets: [Target] = [
    target
]

let project = Project(
    name: "HaneCore",
    targets: targets
)
