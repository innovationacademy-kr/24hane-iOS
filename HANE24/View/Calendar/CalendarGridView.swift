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
        let min = Date(2022, 8, 1)
        let max = Date()
        return min...max
    }

    /// SelectedDate 받아서 달력에 들어갈 날짜를 [Date?]로 계산해줌
    /// 1일 이전 빈칸은 nil
    /// 각 날짜 0시 정각
    var daysOfMonth: [Date?] {
        var firstDay: Date {
            let cal = Calendar.current
            let dateComponents = DateComponents(year: selectedDate.yearToInt, month: selectedDate.monthToInt)
            return cal.date(from: dateComponents) ?? Date()
        }
        var lastDay: Date {
            let cal = Calendar.current
            let nextMonth = cal.date(byAdding: .month, value: 1, to: firstDay) ?? selectedDate
            let endOfMonth = cal.date(byAdding: .day, value: -1, to: nextMonth) ?? selectedDate
            return endOfMonth
        }
        var days: [Date?] = []

        for _ in 1..<firstDay.weekdayToInt {
            days.append(nil)
        }

        var day = firstDay
        while day <= lastDay {
            days.append(day)
            day = Calendar.current.date(byAdding: .day, value: 1, to: day) ?? lastDay
        }
        return days
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
            let weekdays = ["일", "월", "화", "수", "목", "금", "토"]
            let cols: [GridItem] = Array(repeating: GridItem(.flexible(), spacing: 20), count: 7)

            ZStack {
                LoadingAnimation()
                    .isHidden(!hane.loading)

                VStack {
                    // day of week
                    LazyVGrid(columns: cols, spacing: 12) {
                        ForEach(weekdays, id: \.self) { dayOfWeek in
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
                        ForEach(daysOfMonth.indices, id: \.self) { d in
                            if let day = daysOfMonth[d] {
                                Button {
                                    selectedDate = day
                                } label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: day.isSameDate(with: selectedDate) ? 20 : 10)
                                            .foregroundColor(day.isSameDate(with: selectedDate)
                                                             ? .dateSelected
                                                             : day.isSameDate(with: Date.now)
                                                             ? .backgroundCalendar
                                                             : calculateLogColor(accumulationTime: hane.dailyTotalTimesInAMonth[day.dayToInt]))
                                            .overlay {
                                                if day.isSameDate(with: Date())
                                                    && !day.isSameDate(with: selectedDate) {
                                                    RoundedRectangle(cornerRadius: 10)
                                                        .stroke(Color.dateToday, lineWidth: 1)
                                                }
                                            }
                                            .isHidden(day > Date.now)

                                        Text("\(day.dayToInt)")
                                            .foregroundColor(day > Date.now
                                                             ? .fontDisabled
                                                             : day.isSameDate(with: selectedDate)
                                                             ? .fontWhite
                                                             : day.isSameDate(with: Date.now)
                                                             ? .dateToday
                                                             : .fontDefault)
                                            .font(.system(size: 14, weight: day.isSameDate(with: selectedDate) ? .bold : .regular))
                                    }
                                }
                                .frame(width: 30, height: 30)
                                .disabled(day > Date.now)
                            } else {
                                Text("")
                            }
                        }
                    }
                    .isHidden(hane.loading)
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

    func calculateLogColor(accumulationTime: Int64) -> Color {
        switch accumulationTime {
        case 0:
            return .backgroundCalendar
        case 1 ... 14400:
            return .dateBackgroundLevel1
        case 14400 ... 28800:
            return .dateBackgroundLevel2
        case 28800 ... 43200:
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
