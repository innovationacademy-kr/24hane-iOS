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
        VStack(spacing: 22.5) {
            TodayAccTimeCardView(homeManager: homeViewModel, isNoticed: $isNoticedTagLatencyInfo)
            
            ThisMonthAccTimeCardView(homeViewModel: homeViewModel, isNoticed: $isNoticedFundInfo)
        }
        .padding(.horizontal, 30)
    }
}

