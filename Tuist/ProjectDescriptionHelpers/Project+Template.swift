import ProjectDescription

let bundleID = "net.hejang.-4HANE"

public let widgetTarget = Target(
    name: "HANE24Widget",
    platform: .iOS,
    product: .appExtension,
    bundleId:  bundleID + ".WidgetExtension",
    deploymentTarget: .iOS(targetVersion: "17.0", devices: [.iphone]),
    infoPlist: .file(path: .relativeToRoot("HANE24Widget/Info.plist")),
    sources: [.glob(.relativeToRoot("HANE24Widget/**"))],
    //                    resources: [.glob(pattern: .relativeToRoot("WidgetExtension/Resources/**"))],
    //                    entitlements: .relativeToRoot("HANE24Widget/HANE24WidgetExtension.entitlements"),
    dependencies: [])


public extension Project {

    static func generateTarget(
        name: String,
        product: Product,
        bundleID: String,
        //        schemes: [Scheme] = [],
        deploymentTarget: ProjectDescription.DeploymentTarget? = nil,
        infoPlist: ProjectDescription.InfoPlist? = .default,
        dependencies: [TargetDependency] = [],
        resources: ProjectDescription.ResourceFileElements? = nil
    ) -> Target {
        return Target(
            name: name,
            platform: .iOS,
            product: product,
            bundleId: bundleID,
            deploymentTarget: deploymentTarget,
            infoPlist: infoPlist,
            sources: ["Sources/**"],
//            resources: resources,
            dependencies: dependencies
        )
    }

    static func project(
        name: String,
        product: Product,
        bundleID: String,
        schemes: [Scheme] = [],
        dependencies: [TargetDependency] = [],
        resources: ProjectDescription.ResourceFileElements? = nil,
        target: [Target] = []
    ) -> Project {
        return Project(
            name: name,
            targets: target,
            schemes: schemes
        )
    }

    static func app(
        name: String,
        dependencies: [TargetDependency] = [],
        resources: ProjectDescription.ResourceFileElements? = nil,
        target: Target = widgetTarget
    ) -> Project {
        return self.project(
            name: name,
            product: .app,
            bundleID: "\(bundleID).\(name)",
            dependencies: dependencies,
            //            resources: resourct
            target: [
                generateTarget(
                    name: name,
                    product: .app,
                    bundleID: "\(bundleID).\(name)",
                    deploymentTarget: .iOS(targetVersion: "15.0", devices: [.iphone]),
                    infoPlist: .file(path: .relativeToRoot("HANE24/Info.plist"))),
                generateTarget(
                    name: "\(name)Tests",
                    product: .unitTests,
                    bundleID: "\(bundleID).\(name)",
                    deploymentTarget: .iOS(targetVersion: "15.0", devices: [.iphone]),
                    infoPlist: .file(path: .relativeToRoot("HANE24/Info.plist")),
                    dependencies: [
                        .target(name: name)]), widgetTarget]
        )
    }

    static func makeFramework(
        name: String,
        dependencies: [TargetDependency] = [],
        resources: ProjectDescription.ResourceFileElements? = nil
    ) -> Project {
        return .project(
            name: name,
            product: .framework,
            bundleID: "\(bundleID).\(name)",
            target: [
                generateTarget(
                    name: name,
                    product: .framework,
                    bundleID: "\(bundleID).\(name)",
                    deploymentTarget: .iOS(targetVersion: "15.0", devices: [.iphone]),
                    infoPlist: .file(path: .relativeToRoot("HANE24/Info.plist")),
                    dependencies: dependencies
//                    resources: .default
                ),
                generateTarget(
                    name: "\(name)Tests",
                    product: .unitTests,
                    bundleID: "\(bundleID).\(name)",
                    deploymentTarget: .iOS(targetVersion: "15.0", devices: [.iphone]),
                    infoPlist: .file(path: .relativeToRoot("HANE24/Info.plist")),
                    dependencies: [
                        .target(name: name)
                    ]
//                    resources: .default
                )
            ]
        )
    }

    static func framework(
        name: String,
        dependencies: [TargetDependency] = [],
        resources: ProjectDescription.ResourceFileElements? = nil
    ) -> Project {
        return .project(
            name: name,
            product: .framework,
            bundleID: "\(bundleID).\(name)",
            target: [
                generateTarget(
                    name: name,
                    product: .framework,
                    bundleID: "\(bundleID).\(name)",
                    deploymentTarget: .iOS(targetVersion: "15.0", devices: [.iphone]),
                    infoPlist: .file(path: .relativeToRoot("HANE24/Info.plist")),
                    dependencies: dependencies,
                    resources: .default
                ),
                generateTarget(
                    name: "\(name)Tests",
                    product: .unitTests,
                    bundleID: "\(bundleID).\(name)",
                    deploymentTarget: .iOS(targetVersion: "15.0", devices: [.iphone]),
                    infoPlist: .file(path: .relativeToRoot("HANE24/Info.plist")),
                    dependencies: [
                        .target(name: name)
                    ],
                    resources: .default
                )
            ]
        )
    }

    static func appExtension(
        name: String,
        dependencies: [TargetDependency] = [],
        resources: ProjectDescription.ResourceFileElements? = nil
    ) -> Project {
        return .project(
            name: name,
            product: .appExtension,
            bundleID: bundleID + ".WidgetExtension",
            target: [
                generateTarget(
                    name: name,
                    product: .app,
                    bundleID: bundleID,
                    deploymentTarget: .iOS(targetVersion: "15.0", devices: [.iphone]),
                    infoPlist: .file(path: .relativeToRoot("HANE24/Info.plist"))
                )
            ]
        )
    }
}

public extension ProjectDescription.ResourceFileElements {

    static let `default`: ProjectDescription.ResourceFileElements = ["Resources/**"]

}

//public extension Project {
//    static func makeModule(
//        name: String,
//        platform: Platform = .iOS,
//        product: Product,
//        organizationName: String = "Hane24-iOS",
//        packages: [Package] = [],
//        deploymentTarget: DeploymentTarget? = .iOS(targetVersion: "15.0", devices: [.iphone]),
//        dependencies: [TargetDependency] = [
//        ],
//        sources: SourceFilesList? = nil,
//        resources: ResourceFileElements? = nil,
//        infoPlist: InfoPlist = .default
//    ) -> Project {
//        let settings: Settings = .settings(
//            base: [:],
//            configurations: [
//                .debug(name: .debug),
//                .release(name: .release)
//            ], defaultSettings: .recommended)
//
//        let appTarget = Target(
//            name: name,
//            platform: platform,
//            product: product,
//            bundleId: "\(organizationName).\(name)",
//            deploymentTarget: deploymentTarget,
//            infoPlist: infoPlist,
//            sources: sources,
//            resources: resources
//        )
//
//        let targets: [Target] = [appTarget]
//
//        return Project(
//            name: name,
//            organizationName: organizationName,
//            packages: packages,
//            settings: settings,
//            targets: targets
//        )
//    }
//}
