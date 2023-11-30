//
//  ColorExtension.swift
//  HANE24
//
//  Created by Katherine JANG on 2/13/23.
//

import Foundation
import SwiftUI

extension Color {
    static let textGray = Color(hex: "9B9797")
    static let chartDetailBG = Color(hex: "333333")
    static let gradientBlue = Color(hex: "#9AC3F4")
    static let gradientPurple = Color(hex: "735BF2")
    static let LightDefaultBG = Color(hex: "F5F5F5")
    static let iconColor = Color(hex: "5B5B5B")
    static let textGrayMoreView = Color(hex: "707070")
    static let gradientWhtie = Color(hex: "A3D1EC")
    static let LightcalendarColorLv1 = Color(hex: "9AC3F4").opacity(0.4)
    static let LightcalendarColorLv2 = Color(hex: "90A7F4").opacity(0.5)
    static let LightcalendarColorLv3 = Color(hex: "807DF3").opacity(0.7)
    static let LightcalendarColorLv4 = Color(hex: "735BF2").opacity(0.9)

    static let DarkcalendarColorLv1 = Color(hex: "735BF2").opacity(0.2)
    static let DarkcalendarColorLv2 = Color(hex: "735BF2").opacity(0.4)
    static let DarkcalendarColorLv3 = Color(hex: "735BF2").opacity(0.7)
    static let DarkcalendarColorLv4 = Color(hex: "735BF2").opacity(0.9)

    static let DarkDefaultBG = Color(hex: "333333")
}

extension Color {

    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")

        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)

        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >> 8) & 0xFF) / 255.0
        let b = Double((rgb >> 0) & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b)
    }
}
