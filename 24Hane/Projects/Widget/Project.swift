//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by Hosung Lim on 6/17/24.
//

import ProjectDescription

let name = "HANE24Widget"
let organizationName = "24HANE"
let appBundleId = "net.hejang.-4HANE.HANE24Widget"
let targetVersion = "15.0"

let widgetTarget: [Target] = [
    .target(
        name: name,
        destinations: .iOS,
        product: .appExtension,
        bundleId: appBundleId,
        deploymentTargets: .iOS("15.0"),
        infoPlist: .file(path: .relativeToRoot("Supports/Info.plist")),
        sources: "Sources/**",
        resources: "Resources/**",
        entitlements: .file(path: .relativeToRoot("Supports/24HANE.entitlements")),
        dependencies: [
            .project(target: "HaneCore", path: .relativeToRoot("Projects/Core"))
        ]
    )
]

let project = Project(
    name: "Widget",
    targets: widgetTarget
)
