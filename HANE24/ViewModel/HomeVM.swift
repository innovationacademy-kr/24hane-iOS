//
//  HomeVM.swift
//  24HANE
//
//  Created by Katherine JANG on 3/26/24.
//

import Foundation

class HomeVM: ObservableObject {
    @Published var isInCluster: Bool

	@Published var fundInfoNotice: InfoMessage
	@Published var tagLatencyNotice: InfoMessage

	/// 누적시간데이터
	@Published var dailyAccumulationTime: Int64 = 0
	@Published var accumulationTimes: AccumulationTimes

	@Published var isLoading: Bool

	@Published var mainInfo: MainInfo

    var timer: Timer?
	var lastTag: Date?

	init() {
		self.isInCluster = false

        self.fundInfoNotice = InfoMessage()
		self.tagLatencyNotice = InfoMessage( )

		self.isLoading = false

		self.mainInfo = MainInfo()

		self.accumulationTimes = AccumulationTimes()

		self.lastTag = Date()

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
	func updateAccumulationTimes() async {
        do {
            guard let accTimes = try await NetworkManager.shared.getRequest("/v3/tag-log/accumulationTimes", type: AccumulationTimes.self) else {
                throw CustomError.responseBodyEmpty
            }
            self.accumulationTimes = accTimes
            self.dailyAccumulationTime = accTimes.todayAccumulationTime
        } catch {
            ErrorHandler.shared.handleError(error)
        }
	}

    //TODO: 요청한 데이터가 nil일 경우 에러 핸들링
	@MainActor
    func updateMainInfo() async {
        do {
            guard let mainInfo = try await NetworkManager.shared.getRequest("/v3/tag-log/maininfo", type: MainInfo.self) else {
                throw MyError.tokenExpired("")
            }
            self.mainInfo = mainInfo
            self.isInCluster = mainInfo.inoutState == "IN"
            self.fundInfoNotice = mainInfo.infoMessages.fundInfoNotice
            self.tagLatencyNotice = mainInfo.infoMessages.tagLatencyNotice
        } catch {
            print("error caught")
            ErrorHandler.shared.handleError(error)
        }
	}

    @MainActor
    func refresh() async throws {
        await self.updateMainInfo()
        await self.updateAccumulationTimes()
    }
}
