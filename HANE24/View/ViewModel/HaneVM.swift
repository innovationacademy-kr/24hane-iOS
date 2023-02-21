//
//  HaneVM.swift
//  HANE24
//
//  Created by Yunki on 2023/02/17.
//

import Foundation

enum Status {
    case beforeSignIn
    case webViewLoding
    case webViewAppear
    case afterSignIn
}

class Hane: ObservableObject {
    @Published var dailyAccumulationTime: Int64 = 0
    @Published var monthlyAccumulationTime: Int64 = 0
    @Published var status: Status = .beforeSignIn
    @Published var monthlyLogs: [Date: [InOutLog]] = [:]
    @Published var dailyTotalTimesInAMonth: [Int64] = Array(repeating: 0, count: 32)
    
    var inOutLog: InOutLog
    var perMonth: PerMonth
    var mainInfo: MainInfo
    var accumulationTimes: AccumulationTimes
    
    var APIroot: String
    
    init() {
        self.dailyAccumulationTime = 0
        self.monthlyAccumulationTime = 0
        self.status = .beforeSignIn
        self.monthlyLogs = [:]
        self.dailyTotalTimesInAMonth = []
        
        self.inOutLog = InOutLog(inTimeStamp: nil, outTimeStamp: nil, durationSecond: nil)
        self.perMonth = PerMonth(login: "", profileImage: "", inOutLogs: [])
        self.mainInfo = MainInfo(login: "", profileImage: "", isAdmin: false, gaepo: 0, seocho: 0, inoutState: "", tagAt: nil)
        self.accumulationTimes = AccumulationTimes(todayAccumulationTime: 0, monthAccumulationTime: 0)

        self.APIroot = "https://" + (Bundle.main.infoDictionary?["API_URL"] as? String ?? "wrong")
        print("self.APIroot = \(self.APIroot)")
    }
    
    func updateAccumulationTime() async throws {
        try await callAccumulationTimes()
        self.dailyAccumulationTime = self.accumulationTimes.todayAccumulationTime
        self.monthlyAccumulationTime = self.accumulationTimes.monthAccumulationTime
    }
    func updateMonthlyLogs(date: Date) async throws {
        try await callPerMonth(year: date.yearToInt, month: date.monthToInt)
        
        // update MonthlyLogs
        self.monthlyLogs = Dictionary(grouping: perMonth.inOutLogs) {
            Date(milliseconds: $0.inTimeStamp ?? $0.outTimeStamp!)
        }
        
        // update Daily Total Accumulation Times
//        self.monthlyLogs.map
    }
    
    func refresh(date: Date) async throws {
        try await callMainInfo()
        try await callAccumulationTimes()
        try await callPerMonth(year: date.yearToInt, month: date.monthToInt)
    }
    
    func isLogin() async throws -> Bool {
        guard let url = URL(string: APIroot + "/user/login/islogin") else {
            fatalError("MissingURL")
        }
        guard let token = UserDefaults.standard.string(forKey: "Token") else {
            self.status = .beforeSignIn
            return false
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = [
            "Authorization" : "Bearer \(String(describing: token))"
        ]
        let (_, response) = try await URLSession.shared.data(for: request)
        
        if (response as? HTTPURLResponse)?.statusCode == 204 {
            return true
        } else {
            return false
        }
    }
    
    private func callJsonAsync<T>(_ url: String, type: T.Type) async throws -> T where T: Decodable {
        guard let url = URL(string: url) else {
            fatalError("MissingURL")
        }
        guard let token = UserDefaults.standard.string(forKey: "Token") else {
            fatalError("UnValid Token")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = [
            "Authorization" : "Bearer \(String(describing: token) )"
        ]
        let (data, response) = try await URLSession.shared.data(for: request)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Access Denied")
        }
        let decodedData =  try JSONDecoder().decode(type.self, from: data)
        return decodedData
    }
    
//    @MainActor
    func callAccumulationTimes() async throws {
        self.accumulationTimes = try await callJsonAsync(APIroot + "/v1/tag-log/accumulationTimes", type: AccumulationTimes.self)
    }
    
//    @MainActor
    func callMainInfo() async throws {
        self.mainInfo = try await callJsonAsync(APIroot + "/v1/tag-log/maininfo", type: MainInfo.self)
    }
    
//    @MainActor
    func callPerMonth(year: Int, month: Int) async throws {
        var components = URLComponents(string: APIroot + "/v1/tag-log/permonth")!
        let year = URLQueryItem(name: "year", value: "\(year)")
        let month = URLQueryItem(name: "month", value: "\(month)")
        components.queryItems = [year, month]
        
        self.perMonth = try await callJsonAsync(components.url!.absoluteString, type: PerMonth.self)
    }
}
