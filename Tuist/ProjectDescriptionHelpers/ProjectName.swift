//
//  ProjectName.swift
//  ProjectDescriptionHelpers
//
//  Created by Katherine JANG on 4/8/24.
//

import ProjectDescription

public enum Module {
    case app
    case home
    case network
	case calendar
	case utils
//    case more
}

extension Module {
    public var name: String {
        switch self {
        case .app :
            return "App"
        case .home:
            return "Home"
        case .network:
            return "Networks"
		case .calendar:
			return "Calendar"
		case .utils:
			return "Utils"
//        case .more:
//            return "More"
        }
    }
    
    public var path: ProjectDescription.Path {
        return .relativeToRoot("Projects/" + self.name)
    }
    
    public var project: TargetDependency {
        return .project(target: self.name, path: self.path)
    }
}

extension Module: CaseIterable {}
