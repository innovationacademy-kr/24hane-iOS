//
//  CalendarView.swift
//  HANE24
//
//  Created by Yunki on 2023/02/15.
//

import SwiftUI

/// selectedDate: Date = 선택 날짜
struct CalendarView: View {
    @State var selectedDate: Date = Date()
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            Theme.CalendarBackgoundColor(forScheme: colorScheme)
                .edgesIgnoringSafeArea(colorScheme == .dark ? .all : .top)
            VStack(spacing: 16) {
                CalendarGridView(selectedDate: selectedDate)
                AccTimeCardForCalendarView()
                TagLogView(logList: [Log(inTime: "123", outTime: "456", logTime: "789"), Log(inTime: "123", outTime: "456", logTime: "789"), Log(inTime: "123", outTime: nil, logTime: "누락"), Log(inTime: "123", outTime: "456", logTime: "789"), Log(inTime: "123", outTime: nil, logTime: nil)])
                    .padding(.top, 10)
            }
            .padding(.horizontal, 30)
        }
    }
}


func theDate(_ str: String) -> Date {
    let tmp = DateFormatter()
    tmp.dateFormat = "yyyy.MM.dd"
    return tmp.date(from: str)!
}

struct CalendarView_Previews: PreviewProvider {
    
    static var previews: some View {
        CalendarView(selectedDate: theDate("2023.03.31"))
    }
}
