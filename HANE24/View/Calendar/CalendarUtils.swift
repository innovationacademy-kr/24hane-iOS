//
//  CalendarUtils.swift
//  24HANE
//
//  Created by Katherine JANG on 12/15/23.
//

import Foundation
import SwiftUI

func calculateLogColor(accumulationTime: Int64) -> Color {
    switch accumulationTime {
    case 0:
        return .backgroundCalendar
    case 1 ... 14400:
        return .dateBackgroundLevel1
    case 14400 ... 28800:
        return .dateBackgroundLevel2
    case 28800 ... 43200:
        return .dateBackgroundLevel3
    default:
        return .dateBackgroundLevel4
    }
}

