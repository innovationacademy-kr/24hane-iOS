//
//  CalendarGridView.swift
//  HANE24
//
//  Created by Yunki on 2023/02/16.
//

import SwiftUI

struct CalendarGridView: View {
    @Binding var picker: Bool
    @Binding var selectedDate: Date
    @EnvironmentObject var hane: Hane
    
    let weekdays = ["일", "월", "화", "수", "목", "금", "토"]
    let cols: [GridItem] = Array(repeating: GridItem(.flexible(), spacing: 20), count: 7)

    var dateRange: ClosedRange<Date> {
        let min = Date(2022, 8, 1)
        let max = Date()
        return min...max
    }

    var body: some View {
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
                    ForEach(selectedDate.daysOfMonth.indices, id: \.self) { d in
                        if let day = selectedDate.daysOfMonth[d] {
                            Button {
                                selectedDate = day
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: day.isSameDate(with: selectedDate) ? 20 : 10)
                                        .foregroundColor(getGridColor(day))
                                        .overlay {
                                            if day.isSameDate(with: Date())
                                                && !day.isSameDate(with: selectedDate) {
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color.dateToday, lineWidth: 1)
                                            }
                                        }
                                        .isHidden(day > Date.now)
                                    
                                    Text("\(day.dayToInt)")
                                        .foregroundColor(getTextColor(day))
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
    
    func getGridColor(_ day: Date) -> Color {
        switch day {
        case day where day.isSameDate(with: selectedDate):
            return .dateSelected
        case day where day.isSameDate(with: Date.now):
            return .backgroundCalendar
        default:
            return calculateLogColor(accumulationTime: hane.dailyTotalTimesInAMonth[day.dayToInt])
        }
    }
    
    func getTextColor(_ day: Date) -> Color {
        switch day {
        case day where day > Date.now :
            return .fontDisabled
        case day where day.isSameDate(with: selectedDate):
            return .fontWhite
        case day where day.isSameDate(with: Date.now):
            return .dateToday
        default:
            return .fontDefault
        }
    }
    
}



#Preview {
    CalendarGridView(picker: .constant(false), selectedDate: .constant(Date()))
        .environmentObject(Hane())
}
