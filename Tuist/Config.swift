import Foundation
import ProjectDescription

// TODO: - 스키마 설정 필요

let setting = Settings.settings(
	configurations: [
		.debug(name: "Hane Debug Scheme", xcconfig: "../HANE24/env.xcconfig"),
		.release(name: "Hane Release Scheme", xcconfig: "../HANE24/env.xcconfig")
	]
)

let config = Config(
)
