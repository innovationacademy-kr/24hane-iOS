//
//  CalendarView.swift
//  WatchHANE24 Watch App
//
//  Created by Katherine JANG on 4/21/24.
//

import SwiftUI

struct CalendarView: View {
    let today = Date()
    var body: some View {
        VStack {
            HStack {
                Text("\(today.yearToString).\(today.monthToString)")
                    .font(.title3).bold()
                Spacer()
            }
            CalendarGridView()
        }
    }
}

#Preview {
    CalendarView()
}
