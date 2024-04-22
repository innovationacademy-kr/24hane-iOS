//
//  CalendarGridView.swift
//  WatchHANE24 Watch App
//
//  Created by Katherine JANG on 4/21/24.
//

import SwiftUI

struct CalendarGridView: View {
    @StateObject var calendarVM = CalendarVM()
    let today = Date()

    let weekdays = ["일", "월", "화", "수", "목", "금", "토"]
    let cols: [GridItem] = Array(repeating: GridItem(.flexible(), spacing: 18), count: 7)

    var body: some View {
        ZStack {
            VStack {
                // day of week
                LazyVGrid(columns: cols) {
                    ForEach(weekdays, id: \.self) { dayOfWeek in
                        Text("\(dayOfWeek)")
                            .foregroundColor(.white)
                            .font(.footnote)
                    }
                }

                // days with color
                // is future ? disabled
                // is selected ? Circle with white font
                // is today ? border only
                // default
                LazyVGrid(columns: cols, spacing: 10) {
                    ForEach(today.daysOfMonth.indices, id: \.self) { d in
                        if let day = today.daysOfMonth[d] {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 3)
                                        .foregroundColor((getGridColor(day)))
                                        .scaledToFill()
                                    Text("\(day.dayToInt)")
                                        .foregroundColor(.black)
                                        .padding(2)
                                        .font(.footnote)
                                        .scaledToFit()
                                }
                        } else {
                            Text("")
                        }
                    }
                }
            }
            .scaledToFit()
            .padding()
        }
    }

    func getGridColor(_ day: Date) -> Color {
        switch day {
        case day where day.isSameDate(with: today):
            return .dateSelected
        case day where day.isSameDate(with: Date.now):
            return .backgroundCalendar
        default:
            return calculateLogColor(accumulationTime: calendarVM.calendarModel.dailyTotalTimesInAMonth[day.dayToInt])
        }
    }

    func getTextColor(_ day: Date) -> Color {
        switch day {
        case day where day > Date.now:
            return .fontDisabled
        case day where day.isSameDate(with: today):
            return .fontWhite
        case day where day.isSameDate(with: Date.now):
            return .dateToday
        default:
            return .fontDefault
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
    CalendarGridView()
//        .environmentObject(CalendarVM())
//        .environmentObject(Hane())
}
