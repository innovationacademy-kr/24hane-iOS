//
//  AccTimeView.swift
//  24HANE
//
//  Created by Katherine JANG on 6/18/24.
//

import SwiftUI

struct AccTimeView: View {
    @ObservedObject var homeViewModel: HomeViewModel
    
    @State var isTodayAccTimeCardViewFold = false
    @State var isMontyAcctimeCardViewFold = false
    
    @State var isNoticedFundInfo: Bool = false
    @State var isNoticedTagLatencyInfo: Bool = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 22.5) {
            TodayAccTimeCardView(homeViewModel: homeViewModel)
            
            ThisMonthAccTimeCardView(homeViewModel: homeViewModel)
        }
        .padding(.horizontal, 30)
    }
}

