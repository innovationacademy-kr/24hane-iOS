//
//  ReissueTest.swift
//  ReissueTest
//
//  Created by Hosung Lim on 4/15/24.
//

import XCTest
@testable import Hane

final class ReissueTest: XCTestCase {

	var successSut: ReissueVM!
	var failSut: ReissueVM!

	override func setUpWithError() throws {
		try super.setUpWithError()
		successSut = ReissueVM(network: FakeReissueSuccessNetwork.shared)
		failSut = ReissueVM(network: FakeReissueFailNetwork.shared)
	}

	override func tearDownWithError() throws {
		successSut = nil
		failSut = nil
		try super.tearDownWithError()
	}

	// 카드 재발급 상태를 업데이트하는 테스트 구간
	func testGetCardStateSuccessful() async {
		do {
			try await successSut.updateReissueState()
			let expectedStateRawValue = CardState.none.rawValue
			let actualStateRawValue = successSut.cardReissueState.rawValue
			XCTAssertEqual(expectedStateRawValue, actualStateRawValue)
		} catch {
			XCTFail()
		}
	}

	// 카드 재발급 요청 성공
	func testSuccessRequest() async {
		do {
			try await successSut.requestReissue()
			XCTAssertFalse(successSut.loading)
		} catch {
			XCTFail()
		}
	}

	// 카드 재발급 요청 실패
	func testFailRequest() async {
		
	}

}
