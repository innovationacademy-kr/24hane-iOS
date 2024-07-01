import ProjectDescription
//
//public extension Project {
//    static func project() -> Project {
//        return project()
//    }
//    
//    static func framework(
//    ) -> Project {
//        return self.project()
//    }
//}
//

public extension Project {
    
    static func project(
        name: String,
        target: [Target] = []
    ) -> Project {
        return Project(
            name: name,
            targets: target
        )
    }
    
    static func app(
        dependencies: [TargetDependency] = [],
        resources: ProjectDescription.ResourceFileElements? = nil,
        target: Target
    ) -> Project {
        return self.project(
            name: target.name,
            target: [
                target
            ]
        )
    }
    
    static func framework(
        dependencies: [TargetDependency] = [],
        resources: ProjectDescription.ResourceFileElements? = nil,
        target: Target
    ) -> Project {
        return self.project(
            name: target.name,
            target: [
                target
            ]
        )
    }
    
    static func appExtension(
        dependencies: [TargetDependency] = [],
        resources: ProjectDescription.ResourceFileElements? = nil,
        target: Target
    ) -> Project {
        return self.project(
            name: target.name,
            target: [
                target
            ]
        )
    }
    
}
//
//let apptarget = Target.target(
//    name: "24HANE",
//    destinations: .iOS,
//    product: .app,
//    bundleId: "net.hejang.-4HANE",
//    deploymentTargets: .iOS("15.0"),
//    infoPlist:  "./HANE24/Info.plist",
//    sources: ["./HANE24/HANE24App/Sources/**"],
//    resources: ["./HANE24/HANE24App/Resources/**"],
//    dependencies: []
//)

let testTarget = Target.target(
    name: "HANE24Test",
    destinations: .iOS,
    product: .unitTests,
    bundleId: "kr.hoslim.24hane.HANE24Test",
    deploymentTargets: .iOS("15.0"),
//    infoPlist: "Tuist/Source/Info.plist",
    sources: ["./HANE24/HANE24Tests/Sources/**"],
    resources: [],
    dependencies: [.target(name: "24HANE")]
)

let widgetTarget = Target.target(
    name: "HANE24Widget",
    destinations: .iOS,
    product: .appExtension,
    bundleId: "net.hejang.-4HANE.HANE24Widget",
    deploymentTargets: .iOS("15.0"),
    infoPlist:  "./HANE24/HANE24Widget/Info.plist",
    sources: ["./HANE24/HANE24Widget/Sources/**"],
    resources: [],
    dependencies: [.target(name: "24HANE")]
)

