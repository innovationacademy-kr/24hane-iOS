//
//  AccTimeCardForCalendarView.swift
//  HANE24
//
//  Created by Yunki on 2023/02/16.
//

import SwiftUI

struct AccTimeCardForCalendarView: View {
   
    @Environment(\.colorScheme) var colorScheme
    
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .overlay( colorScheme == .dark ? RoundedRectangle(cornerRadius: 10).stroke(.white, lineWidth: 2) : nil)
                .foregroundColor(Color(hex: "#333333"))
            
            Text("총 \(81)시간 \(41)분")
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.white)
        }
        .frame(height: 45)
    }
}

struct AccTimeCardForCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        AccTimeCardForCalendarView()
    }
}
