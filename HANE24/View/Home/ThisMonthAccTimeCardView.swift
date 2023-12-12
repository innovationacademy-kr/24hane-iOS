//
//  ThisMonthAccTimeCardView.swift
//  24HANE
//
//  Created by Yunki H on 12/12/23.
//

import SwiftUI

struct ThisMonthAccTimeCardView: View {
    @EnvironmentObject var hane: Hane

    @Binding var isNoticed: Bool

    @State var isFold: Bool = true

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(isFold ? Color(hex: "#735BF2") : .white)
        }
    }
}

#Preview {
    var hane = Hane()
    hane.loading = false
    hane.monthlyAccumulationTime = 34567
    hane.thisMonthAcceptedAccumulationTime = 12345
    return ThisMonthAccTimeCardView(isNoticed: .constant(false))
        .environmentObject(hane)
}
