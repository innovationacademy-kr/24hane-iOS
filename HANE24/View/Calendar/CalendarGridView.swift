//
//  CalendarGridView.swift
//  HANE24
//
//  Created by Yunki on 2023/02/16.
//

import SwiftUI

struct CalendarGridView: View {
    @Binding var selectedDate: Date
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var hane: Hane
    
    var body: some View {
        VStack {
            // 상단 문자열
            HStack {
                Button {
                    selectedDate = Calendar.current.date(byAdding: .month, value: -1, to: selectedDate)!
                    task{
                        do{
                            try await hane.refresh(date: selectedDate)
                        } catch {
                            print("error")
                        }
                    }
                } label: {
                    Image(systemName: "chevron.left")
                        .resizable()
                        .frame(width: 8, height: 12)
                        
                }
                
                Spacer()
                
                Text("\(selectedDate.yearToString).\(selectedDate.monthToString)")
                
                Spacer()
                
                Button {
                    selectedDate = Calendar.current.date(byAdding: .month, value: 1, to: selectedDate)!
                    task{
                        do{
                            try await hane.refresh(date: selectedDate)
                        } catch {
                            print("error")
                        }
                    }
                } label: {
                    Image(systemName: "chevron.right")
                        .resizable()
                        .frame(width: 8, height: 12)
                }
            }
            .foregroundColor(colorScheme == .dark ? .white : Color(hex: "#5B5B5B"))
            .font(.system(size: 20, weight: .semibold))
            .padding(10)
            .padding(.top, 20)
            .padding(.bottom, 8)
            
            // LazyGrid
            let week = ["일", "월", "화", "수", "목", "금", "토"]
            let cols: [GridItem] = Array(repeating: GridItem(.flexible(), spacing: 20), count: 7)
            
            VStack {
                LazyVGrid(columns: cols, spacing: 12) {
                    // day of week
                    ForEach(week, id: \.self) { dayOfWeek in
                        Text("\(dayOfWeek)")
                            .foregroundColor(Color(hex: "#979797"))
                            .font(.system(size: 13, weight: .light))
                    }
                    
                    // days with color
                    // is future ? disabled
                    // is selected ? Circle with white font
                    // is today ? border only
                    // default
                    ForEach((daysOfMonth(selectedDate)), id: \.self) { dayOfMonth in
                        if dayOfMonth > 0 {
                            Button {
                                let dateFormatter = DateFormatter()
                               dateFormatter.dateFormat = "yyyy.M.d"
                               if let date = dateFormatter.date(from: "\(selectedDate.yearToInt).\(selectedDate.monthToInt).\(dayOfMonth)") {
                                   selectedDate = date
                               } else {
                                   selectedDate = Date()
                               }
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: dayOfMonth == selectedDate.dayToInt ? 20 : 10)
                                        .foregroundColor(dayOfMonth == selectedDate.dayToInt
                                                         ? Color(hex: "#735BF2")
                                                         : "\(selectedDate.yearToInt).\(selectedDate.MM).\(String(format: "%02d", dayOfMonth))" == Date().yyyyMMdd
                                                         ? Color.white.opacity(100)
                                                         : calculateLogColor(accumulationTime: hane.dailyTotalTimesInAMonth[dayOfMonth])) //TODO -> colorLevelTable
                                        .overlay {
                                            if "\(selectedDate.yearToInt).\(selectedDate.MM).\(String(format: "%02d", dayOfMonth))" == Date().yyyyMMdd && dayOfMonth != selectedDate.dayToInt {
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color(hex: "#735BF2"), lineWidth: 1)
                                            }
                                        }
                                        .isHidden("\(selectedDate.yearToInt).\(selectedDate.MM).\(String(format: "%02d", dayOfMonth))" > Date().yyyyMMdd)
                                    
                                    Text("\(dayOfMonth)")
                                        .foregroundColor("\(selectedDate.yearToInt).\(selectedDate.MM).\(String(format: "%02d", dayOfMonth))" > Date().yyyyMMdd
                                                         ? Color(hex: "#979797")
                                                         : dayOfMonth == selectedDate.dayToInt
                                                         ? .white
                                                         : "\(selectedDate.yearToInt).\(selectedDate.MM).\(String(format: "%02d", dayOfMonth))" == Date().yyyyMMdd
                                                         ? Color(hex: "#735BF2")
                                                         : Color(hex: "#333333"))
                                        .font(.system(size: 14, weight: .regular))
                                }
                            }
                            .frame(width: 30, height: 30)
                            .disabled("\(selectedDate.yearToInt).\(selectedDate.MM).\(String(format: "%02d", dayOfMonth))" > Date().yyyyMMdd)
                        } else {
                            Text("")
                        }
                    }
                }
            }
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
    
    func calculateLogColor(accumulationTime: Int64) -> Color {
        switch accumulationTime{
        case 0 :
            return  Color.white.opacity(100)
        case 1 ... 10800 :
            return colorScheme == .light ? Color.LightcalendarColorLv1 : Color.DarkcalendarColorLv1
        case 10801 ... 21600 :
            return colorScheme == .light ? Color.LightcalendarColorLv2 : Color.DarkcalendarColorLv2
        case 21601 ... 32400 :
            return  colorScheme == .light ? Color.LightcalendarColorLv3 : Color.DarkcalendarColorLv3
        default:
            return colorScheme == .light ? Color.LightcalendarColorLv4 : Color.DarkcalendarColorLv4
        }
    }

}


struct CalendarGridView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarGridView(selectedDate: .constant(Date()))
            .environmentObject(Hane())
    }
}