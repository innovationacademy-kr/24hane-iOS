//
//  HaneVM.swift
//  HANE24
//
//  Created by Yunki on 2023/02/17.
//

import Foundation

class Hane: ObservableObject {
    @Published var dailyAccumulationTime: Int = 0
    @Published var monthlyAccumulationTime: Int = 0
    @Published var isSignedIn: Bool = false
    @Published var monthlyLogs: [String: [inOutLog]] = [:]
    @Published var dailyTotalTimesInAMonth: [Int] = []
    
    var APIroot: String
    
    init() {
        self.dailyAccumulationTime = 0
        self.monthlyAccumulationTime = 0
        self.isSignedIn = false
        self.monthlyLogs = [:]
        self.dailyTotalTimesInAMonth = []

        self.APIroot = Bundle.main.infoDictionary?["API_URL"] as? String ?? "wrong"
        print("self.APIroot = \(self.APIroot)")
    }
}
