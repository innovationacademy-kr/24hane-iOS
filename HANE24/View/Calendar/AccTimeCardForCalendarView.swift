//
//  AccTimeCardForCalendarView.swift
//  HANE24
//
//  Created by Yunki on 2023/02/16.
//

import SwiftUI

struct AccTimeCardForCalendarView: View {

    @Environment(\.colorScheme) var colorScheme
    var totalAccTime: Int64

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .overlay( colorScheme == .dark ? RoundedRectangle(cornerRadius: 10).stroke(.white, lineWidth: 2) : nil)
                .foregroundColor(Color(hex: "#333333"))

            Text("총 \(totalAccTime / 3600 )시간 \(totalAccTime % 3600 / 60)분")
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.white)
        }
        .frame(height: 45)
    }
}

#Preview {
    AccTimeCardForCalendarView(totalAccTime: 123456789)
}
