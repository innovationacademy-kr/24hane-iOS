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

    static let DarkDefaultBG = Color(hex: "333333")
    // V3
    static let backgroundDefault = Color("backgroundDefault")
    static let backgroundCalendar = Color("backgroundCalendar")

    static let fontDefault = Color("fontDefault")
    static let fontGray = Color("fontGray")
    static let fontWhite = Color("fontWhite")
    static let fontDisabled = Color("fontDisabled")

    static let dateBackgroundLevel1 = Color("dateBackgroundLevel1")
    static let dateBackgroundLevel2 = Color("dateBackgroundLevel2")
    static let dateBackgroundLevel3 = Color("dateBackgroundLevel3")
    static let dateBackgroundLevel4 = Color("dateBackgroundLevel4")
    static let dateSelected = Color("dateSelected")
    static let dateToday = Color("dateToday")
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
