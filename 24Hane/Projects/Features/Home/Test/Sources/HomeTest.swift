//
//  HomeTest.swift
//  HomeTest
//
//  Created by Katherine JANG on 8/6/24.
//

import XCTest
@testable import Home

final class HomeTest: XCTestCase {
    
    // HomeViewModel 객체
    var sut: HomeViewModel!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        sut = HomeViewModel()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        try super.tearDownWithError()
    }
    
    func testGetWeeklyPeriod() {
        let periods = sut.getWeeklyPeriod()
        
        // 6주간의 기간을 나타내는지 확인
        XCTAssertEqual(periods.count, 6, "6주 간의 기간 필요")
        
        // 반환받는 string의 포맷 확인
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "M.dd(EEE)"
        
        for period in periods {
            let dates = period.split(separator: "-")
            XCTAssertEqual(dates.count, 2, "기간에 대한 포멧 확인")
            
            let startDate = dates[0].trimmingCharacters(in: .whitespaces)
            let endDate = dates[1].trimmingCharacters(in: .whitespaces)
            
            if let _ = formatter.date(from: startDate), let _ = formatter.date(from: endDate) {
                //날짜가 유효한 날짜인지 확인
                XCTAssert(true)
            } else {
                XCTFail("주간 포멧은 'M.dd(EEE)' 형태여야함")
            }
        }
    }
    
    func testMonthlyPeriod() {
        let periods = sut.getMonthlyPeriod()

        XCTAssertEqual(periods.count, 6, "6개월 간의 기록 필요")
        
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY.M"
        
        for period in periods {
            if let _ = formatter.date(from: period) {
                //유효한 달인지 확인
                XCTAssert(true)
            } else {
                XCTFail("주간 포멧은 'M.dd(EEE)' 형태여야함")
            }
        }
        
    }

}
