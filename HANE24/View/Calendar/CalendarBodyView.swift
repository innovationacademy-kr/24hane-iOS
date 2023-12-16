//
//  CalendarBodyView.swift
//  24HANE
//
//  Created by Katherine JANG on 12/15/23.
//

import SwiftUI

struct CalendarBodyView: View {
    @State var picker = false
    @State var datePickerSelection: Date
    @Binding var selectedDate: Date
    
    var dateRange: ClosedRange<Date> {
        let min = Date(2022, 8, 1)
        let max = Date()
        return min...max
    }

    var body: some View {
        VStack {
            CalendarHeaderView(picker: $picker, selectedDate: $selectedDate)
                .padding(10)
                .padding(.bottom, 8)
            ZStack {
                if !picker {
                    CalendarGridView(picker: $picker, selectedDate: $selectedDate)
                } else {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.backgroundCalendar)

                        DatePicker(
                            "Date",
                            selection: $datePickerSelection,
                            in: dateRange,
                            displayedComponents: [.date])
                        .datePickerStyle(WheelDatePickerStyle())
                    }
                    .frame(maxWidth: 100)
                }
            }
        }
        .onChange(of: picker) {pickerState in
            if !pickerState {
                selectedDate = datePickerSelection
            }
        }
    }
}

#Preview {
    CalendarBodyView(datePickerSelection: Date(), selectedDate: .constant(Date()))
}
