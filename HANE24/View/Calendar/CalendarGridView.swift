//
//  CalendarGridView.swift
//  HANE24
//
//  Created by Yunki on 2023/02/16.
//

import SwiftUI

struct CalendarGridView: View {
    @State var picker = false
    @Binding var selectedDate: Date
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var hane: Hane

    var dateRange: ClosedRange<Date> {
        let min = theDate("2022.08.01")
        let max = Date()
        return min...max
    }

    var body: some View {
        VStack {
            // 상단 문자열
            HStack {
                Button {
                    selectedDate = Calendar.current.date(byAdding: .month, value: -1, to: selectedDate)!
                    Task {
                        try await hane.updateMonthlyLogs(date: selectedDate)
                    }
                } label: {
                    ZStack {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .frame(width: 8, height: 12)
                    }
                    .frame(width: 15, height: 15)
                }
                .disabled(selectedDate.toString("yyyy.MM") <= "2022.08" || hane.loading)

                Spacer()

                Text("\(selectedDate.yearToString).\(selectedDate.monthToString)")
                    .foregroundColor(.fontDefault)
                    .onTapGesture {
                        picker.toggle()
                        if !picker {
                            Task {
                                try await hane.updateMonthlyLogs(date: selectedDate)
                            }
                        }
                    }

                Spacer()

                Button(action: {
                    selectedDate = Calendar.current.date(byAdding: .month, value: 1, to: selectedDate)!
                    Task {
                        try await hane.updateMonthlyLogs(date: selectedDate)
                    }
                }, label: {
                    ZStack {
                        Image(systemName: "chevron.right")
                            .resizable()
                            .frame(width: 8, height: 12)
                    }
                    .frame(width: 15, height: 15)
                })
                .disabled(selectedDate.toString("yyyy.MM") >= Date().toString("yyyy.MM") || hane.loading)
            }
            .font(.system(size: 20, weight: .semibold))
            .padding(10)
            .padding(.bottom, 8)

            // LazyGrid
            let week = ["일", "월", "화", "수", "목", "금", "토"]
            let cols: [GridItem] = Array(repeating: GridItem(.flexible(), spacing: 20), count: 7)

            ZStack {
//                LoadingAnimation()
//                    .isHidden(!hane.loading)

                VStack {
                    // day of week
                    LazyVGrid(columns: cols, spacing: 12) {
                        ForEach(week, id: \.self) { dayOfWeek in
                            Text("\(dayOfWeek)")
                                .foregroundColor(.fontDisabled)
                                .font(.system(size: 13, weight: .light))
                        }
                    }

                    // days with color
                    // is future ? disabled
                    // is selected ? Circle with white font
                    // is today ? border only
                    // default
                    LazyVGrid(columns: cols, spacing: 12) {
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
                                                             ? .dateSelected
                                                             : "\(selectedDate.yearToInt).\(selectedDate.MM).\(String(format: "%02d", dayOfMonth))" == Date().toString("yyyy.MM.dd")
                                                             ? .backgroundCalendar
                                                             : calculateLogColor(accumulationTime: hane.dailyTotalTimesInAMonth[dayOfMonth]))
                                            .overlay {
                                                if "\(selectedDate.yearToInt).\(selectedDate.MM).\(String(format: "%02d", dayOfMonth))" == Date().toString("yyyy.MM.dd")
                                                    && dayOfMonth != selectedDate.dayToInt {
                                                    RoundedRectangle(cornerRadius: 10)
                                                        .stroke(Color.dateToday, lineWidth: 1)
                                                }
                                            }
                                            .isHidden("\(selectedDate.yearToInt).\(selectedDate.MM).\(String(format: "%02d", dayOfMonth))" > Date().toString("yyyy.MM.dd"))

                                        Text("\(dayOfMonth)")
                                            .foregroundColor("\(selectedDate.yearToInt).\(selectedDate.MM).\(String(format: "%02d", dayOfMonth))" > Date().toString("yyyy.MM.dd")
                                                             ? .fontDisabled
                                                             : dayOfMonth == selectedDate.dayToInt
                                                             ? .fontWhite
                                                             : "\(selectedDate.yearToInt).\(selectedDate.MM).\(String(format: "%02d", dayOfMonth))" == Date().toString("yyyy.MM.dd")
                                                             ? .dateToday
                                                             : .fontDefault)
                                            .font(.system(size: 14, weight: dayOfMonth == selectedDate.dayToInt ? .bold : .regular))
                                    }
                                }
                                .frame(width: 30, height: 30)
                                .disabled("\(selectedDate.yearToInt).\(selectedDate.MM).\(String(format: "%02d", dayOfMonth))" > Date().toString("yyyy.MM.dd"))
                            } else {
                                Text("")
                            }
                        }
                    }
//                    .isHidden(hane.loading)
                }

                // DatePicker
                if picker {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.backgroundCalendar)

                        DatePicker(
                            "Date",
                            selection: $selectedDate,
                            in: dateRange,
                            displayedComponents: [.date])
                        .datePickerStyle(WheelDatePickerStyle())
                    }
                    .frame(maxWidth: 100)
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
        switch accumulationTime {
        case 0:
            return .backgroundCalendar
        case 1 ... 10800:
            return .dateBackgroundLevel1
        case 10801 ... 21600:
            return .dateBackgroundLevel2
        case 21601 ... 32400:
            return .dateBackgroundLevel3
        default:
            return .dateBackgroundLevel4
        }
    }
}

#Preview {
    CalendarGridView(selectedDate: .constant(Date()))
        .environmentObject(Hane())
}
