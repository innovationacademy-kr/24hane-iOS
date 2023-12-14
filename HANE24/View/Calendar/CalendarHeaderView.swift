//
//  CalendarHeaderView.swift
//  24HANE
//
//  Created by Katherine JANG on 12/15/23.
//

import SwiftUI

struct CalendarHeaderView: View {
    @Binding var picker: Bool
    @Binding var selectedDate: Date
    @EnvironmentObject var hane: Hane

    var body: some View {
        HStack {
            changeMonthButton(isForward: false)
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
            changeMonthButton(isForward: true)
                .disabled(selectedDate.toString("yyyy.MM") >= Date().toString("yyyy.MM") || hane.loading)
        }
        .font(.system(size: 20, weight: .semibold))
    }
    
    @ViewBuilder func changeMonthButton(isForward: Bool) -> some View {
        Button {
            selectedDate = Calendar.current.date(byAdding: .month, value: isForward ? 1 : -1, to: selectedDate)!
            Task {
                try await hane.updateMonthlyLogs(date: selectedDate)
            }
        } label: {
            ZStack {
                Image(systemName: isForward ? "chevron.right" : "chevron.left")
                    .resizable()
                    .frame(width: 8, height: 12)
            }
            .frame(width: 15, height: 15)
        }
    }
}

#Preview {
    CalendarHeaderView(picker: .constant(false), selectedDate: .constant(Date()))
        .environmentObject(Hane())
}
