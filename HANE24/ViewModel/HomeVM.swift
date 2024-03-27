//
//  HomeVM.swift
//  24HANE
//
//  Created by Katherine JANG on 3/26/24.
//

import Foundation

class HomeVM: ObservableObject {
	@Published var isInCluster: Bool
	@Published var profileImage: String
	@Published var userID: String
	@Published var clusterPopulation: Int
	
	@Published var fundInfoNotice: Notice
	@Published var tagLatencyNotice: Notice
	
	/// 누적시간데이터
	@Published var dailyAccumulationTime: Int64 = 0
	@Published var monthlyAccumulationTime: Int64 = 0
	@Published var sixWeekAccumulationTime: [Double] = Array(repeating: 0, count: 6)
	@Published var sixMonthAccumulationTime: [Double] = Array(repeating: 0, count: 6)
	
	@Published var accumulationTime: AccumulationTimes
	
	var mainInfo: MainInfo
	
	var accumulationTimes: AccumulationTimes
	
	var timer: Timer?
	var lastTag: Date?
	
	init() {
		self.isInCluster = false
		self.profileImage = ""
		self.userID = ""
		self.clusterPopulation = 0
		
		self.fundInfoNotice = Notice()
		self.tagLatencyNotice = Notice()
		
		self.mainInfo = MainInfo()
		
		self.accumulationTimes = AccumulationTimes()
		
		self.lastTag = Date()
		
		self.accumulationTime = AccumulationTimes()
		
		self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
			guard let self = self else { return }
			guard self.isInCluster else { return }
			self.dailyAccumulationTime = self.accumulationTimes.todayAccumulationTime
			if let lastTag = self.lastTag {
				self.dailyAccumulationTime += (Date.now.millisecondsSince1970 - lastTag.millisecondsSince1970) / 1000
			}
		}
	}
	
	@MainActor
	func updateUserInfo() async throws {
		try await requestMainInfo()
		
		self.userID = mainInfo.login
		self.profileImage = mainInfo.profileImage
		self.isInCluster = mainInfo.inoutState == "IN" ? true : false
		self.clusterPopulation = mainInfo.gaepo
	}
	
	@MainActor
	func updateNotice() async throws {
		self.fundInfoNotice = Notice(
			title: mainInfo.infoMessages.fundInfoNotice.title,
			content: mainInfo.infoMessages.fundInfoNotice.content
		)
		self.tagLatencyNotice = Notice(
			title: mainInfo.infoMessages.tagLatencyNotice.title,
			content: mainInfo.infoMessages.tagLatencyNotice.content
		)
	}
	
	@MainActor
	func updateAccumulationTime() async throws {
		
	}
	
//TODO: 요청한 데이터가 nil일 경우 에러 핸들링
	func requestMainInfo() async throws {
		guard let mainInfo = try await NetworkManager.shared.getRequest("/v3/tag-log/maininfo", type: MainInfo.self) else {
			throw MyError.tokenExpired("")
		}
		self.mainInfo = mainInfo
	}
	
	@MainActor
	func requestAccumulationTime() async throws {
		guard let accTimes = try await NetworkManager.shared.getRequest("/v3/tag-log/accumulationTimes", type: AccumulationTimes.self) else {
			throw MyError.tokenExpired("")
		}
		self.accumulationTime = accTimes
	}
}
