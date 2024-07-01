import Foundation
import ProjectDescription
import ProjectDescriptionHelpers

public extension Project {
    static func project(
        name: String,
        targets: [Target]
    ) -> Project {
        return Project(
            name: name,
            targets: targets
        )
    }
}

public extension Target {
    static func demoApp(
        module: Modules
    ) -> Target {
        return .target(
            name: module.name,
            destinations: .iOS,
            product: .app,
            bundleId: module.bundleId,
            deploymentTargets: .iOS("15.0"),
            sources: "Demo/Sources/**",
            resources: "Demo/Resources/**",
            dependencies: module.dependencies
        )
    }

    static func app(
        name: String,
        destinations: Destinations = .iOS,
        appBundleId: String,
        deploymentTargets: [DeploymentTargets] = [.iOS("15.0")],
        products: [Product] = [.app],
        sources: SourceFilesList,
        resources: ResourceFileElements,
        dependencies: [TargetDependency]
    ) -> Target {
        return .target(
            name: name,
            destinations: destinations,
            product: .app,
            bundleId: appBundleId,
            deploymentTargets: .iOS("15.0"),
            sources: sources,
            resources: resources,
            dependencies: dependencies
        )
    }

    static func framework(
        module: Modules
    ) -> Target {
        return .target(
            name: module.name,
            destinations: .iOS,
            product: .app,
            bundleId: module.bundleId,
            deploymentTargets: .iOS("15.0"),
            sources: "Sources/**",
            resources: "Resources/**",
            dependencies: module.dependencies
        )
    }
}
