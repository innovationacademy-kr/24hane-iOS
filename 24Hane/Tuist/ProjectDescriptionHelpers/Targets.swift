//
//  Targets.swift
//  ProjectDescriptionHelpers
//
//  Created by Katherine JANG on 7/9/24.
//

import ProjectDescription

public extension Target {
    static func widgetExtensionTarget() -> Target {
        return .target(
            name: "WidgetExtension",
            destinations: .iOS,
            product: .appExtension,
            bundleId: "net.hejang.-4HANE.HANE24Widget",
    //        infoPlist: .file(path: .relativeToRoot("Supports/Info.plist")),
            sources: ["../Widget/Sources/**"],
            resources:["../Widget/Sources/**"],
            entitlements: .file(path: .relativeToRoot("Supports/24HANE.entitlements")),
            dependencies: [
                .project(target: "HaneCore", path: .relativeToRoot("Projects/Core"))
            ]
        )
    }
}
