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
    
    var body: some View {
        VStack {
            // 상단 문자열
            HStack {
                Button {
                    selectedDate = Calendar.current.date(byAdding: .month, value: -1, to: selectedDate)!
                } label: {
                    Image(systemName: "chevron.left")
                }
                Spacer()
                Text("\(selectedDate.yearToString).\(selectedDate.monthToString)")
                    .foregroundColor(.black)
                Spacer()
                Button {
                    selectedDate = Calendar.current.date(byAdding: .month, value: 1, to: selectedDate)!
                } label: {
                    Image(systemName: "chevron.right")
                }
            }
            .foregroundColor(Color(hex: "#5B5B5B"))
            .font(.system(size: 20, weight: .semibold))
            .padding()
            
            // LazyGrid
            let week = ["일", "월", "화", "수", "목", "금", "토"]
            let cols: [GridItem] = Array(repeating: GridItem(.flexible(), spacing: 20), count: 7)
            
            VStack {
                LazyVGrid(columns: cols, spacing: 12) {
                    ForEach(week, id: \.self) { dayOfWeek in
                        Text("\(dayOfWeek)")
                            .foregroundColor(Color(hex: "#979797"))
                            .font(.system(size: 13, weight: .light))
                    }
                    ForEach((daysOfMonth(selectedDate)), id: \.self) { dayOfMonth in
                        if dayOfMonth > 0 {
                            ZStack {
                                RoundedRectangle(cornerRadius: dayOfMonth == selectedDate.dayToInt ? 20 : 10)
                                    .foregroundColor(Color(hex: "#B9ADF9"))
                                    .isHidden(dayOfMonth > Date().dayToInt)
                                
                                Text("\(dayOfMonth)")
                            }
                            .frame(width: 30, height: 30)
                        } else {
                            Text("")
                        }
                    }
                }
            }
            
            // AccTimeCardforCalendarView
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color(hex: "#333333"))
                
                Text("총 \(81)시간 \(41)분")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.white)
            }
            .frame(height: 45)
            
            // LogView
        }
    }
    
    /// 오늘 날짜 받아서 달력에 들어갈 날짜를 [Int]로 뽑는 func
    /// 1일 이전 빈칸은 0일
    func daysOfMonth(_ today: Date) -> [Int] {
        var firstDay: Date {
            let cal = Calendar.current
            let dateComponents = DateComponents(year: today.yearToInt, month: today.monthToInt)
            return cal.date(from: dateComponents) ?? Date()
        }
        var lastDay: Date {
            let cal = Calendar.current
            let nextMonth = cal.date(byAdding: .month, value: 1, to: firstDay) ?? today
            let endOfMonth = cal.date(byAdding: .day, value: -1, to: nextMonth) ?? today
            return endOfMonth
        }
        var days: [Int] = Array()
        
        for i in 1..<firstDay.weekdayToInt {
            days.append(-i)
        }
        for i in 1...lastDay.dayToInt {
            days.append(i)
        }
        return days
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
