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
    @Published var dailyTotalTimesInAMonth: [String: Int] = [:]
    
    let APIroot: String
    
//    guard let infoDictionary: [String: Any] = Bundle.main.infoDictionary else {return}
//    guard let apiRoot: String = infoDictionary["API_URL"] as? String else {return}
//    APIroot = apiRoot
    init(dailyAccumulationTime: Int, monthlyAccumulationTime: Int, isSignedIn: Bool, monthlyLogs: [String : [inOutLog]], dailyTotalTimesInAMonth: [String : Int], APIroot: String) {
        self.dailyAccumulationTime = dailyAccumulationTime
        self.monthlyAccumulationTime = monthlyAccumulationTime
        self.isSignedIn = isSignedIn
        self.monthlyLogs = monthlyLogs
        self.dailyTotalTimesInAMonth = dailyTotalTimesInAMonth
        self.APIroot = APIroot
    }
}
