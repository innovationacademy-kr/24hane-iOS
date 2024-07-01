//
//  AccTimeCardForCalendarView.swift
//  HANE24
//
//  Created by Yunki on 2023/02/16.
//

import SwiftUI

struct AccTimeCardForCalendarView: View {
    @State var showValidTime: Bool = false
    var totalAccTime: Int64
    var validAccTime: Int64

    var body: some View {
        Button(action: {
            showValidTime.toggle()
        }, label: {
            if showValidTime {
                AccumulationValidTimeView(validAccTime: validAccTime)
            } else {
                AccumulationTotalTimeView(totalAccTime: totalAccTime)
            }
        })
        .frame(height: 45)
    }
}

#Preview {
    AccTimeCardForCalendarView(totalAccTime: 1234567, validAccTime: 1234567)
}
