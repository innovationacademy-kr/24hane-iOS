//
//  SettingViewModel.swift
//  HANE24Watch
//
//  Created by Hosung Lim on 5/27/24.
//

import Foundation

protocol DisplaySettingDataProtocol {
    var displaySettig: DisplaySettingModel { get }
}

protocol DisplaySettingLogicProtocol {
    func setUpDisplaySetting()
}

protocol DisplaySettingViewModelProtocol: ObservableObject {
    var displayData: DisplaySettingDataProtocol { get }
    var displayLogic: DisplaySettingLogicProtocol { get }
}

class DisplaySettingViewModel: DisplaySettingViewModelProtocol {
    let displayData: DisplaySettingDataProtocol
    let displayLogic: DisplaySettingLogicProtocol
    
    init(displayData: DisplaySettingData, displayLogic: DisplaySettingLogic) {
        self.displayData = displayData
        self.displayLogic = displayLogic
    }
}

class DisplaySettingData: DisplaySettingDataProtocol {
    @Published var displaySettig: DisplaySettingModel = DisplaySettingModel()
}

class DisplaySettingLogic: DisplaySettingLogicProtocol {
    func setUpDisplaySetting() {
        
    }
}
