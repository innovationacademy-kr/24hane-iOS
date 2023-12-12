//
//  AccTimeCardForCalendarView.swift
//  HANE24
//
//  Created by Yunki on 2023/02/16.
//

import SwiftUI

struct AccTimeCardForCalendarView: View {
    @Environment(\.colorScheme) var colorScheme
    @State var showValidTime: Bool = false
    var totalAccTime: Int64
    var validAccTime: Int64

    var body: some View {
        Button(action: {
            showValidTime.toggle()
        }, label: {
            if showValidTime {
                validTime
            } else {
                totalTime
            }
        })
        .frame(height: 45)
    }

    var totalTime: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .overlay( colorScheme == .dark ? RoundedRectangle(cornerRadius: 10).stroke(.white, lineWidth: 2) : nil)
                .foregroundColor(Color(hex: "#333333"))

            Text("총 \(totalAccTime / 3600 )시간 \(totalAccTime % 3600 / 60)분")
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.white)
        }
    }

    var validTime: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color(hex: "#735BF2"))
                .overlay( colorScheme == .dark ? RoundedRectangle(cornerRadius: 10).stroke(.white, lineWidth: 2) : nil)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(hex: "#735BF2"), lineWidth: 3)
                    .shadow(color: Color(hex: "#333333"), radius: 4, x: 2, y: 5)
                    .clipShape(
                       RoundedRectangle(cornerRadius: 15)
                   )
                )
            Text("인정 시간 \(totalAccTime / 3600 )시간 \(totalAccTime % 3600 / 60)분")
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.white)
        }
    }
}

#Preview {
    AccTimeCardForCalendarView(totalAccTime: 123456789, validAccTime: 12345678)
}
