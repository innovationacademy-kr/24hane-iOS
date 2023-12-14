//
//  CalendarBodyView.swift
//  24HANE
//
//  Created by Katherine JANG on 12/15/23.
//

import SwiftUI

struct CalendarBodyView: View {
    @State var picker = false
    @Binding var selectedDate: Date
    
    
    var body: some View {
        CalendarHeaderView(picker: $picker, selectedDate: $selectedDate)
            .padding(10)
            .padding(.bottom, 8)
        CalendarGridView(picker: $picker, selectedDate: $selectedDate)
    }
}


#Preview {
    CalendarBodyView(selectedDate: .constant(Date()))
}
