//
//  SettingViewModel.swift
//  HANE24Watch
//
//  Created by Hosung Lim on 5/27/24.
//

import Foundation

enum ViewList: Int {
    case accumulate
    case goal
}

struct DisplaySettingModel {
    // 설정에서 첫 화면 관련
    var displaySetting: ViewList = .accumulate
}
