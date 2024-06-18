//
//  AccTimeView.swift
//  24HANE
//
//  Created by Katherine JANG on 6/18/24.
//

import SwiftUI

struct AccTimeView: View {
    @ObservedObject var homeViewModel: HomeViewModel
    
    @State var isNoticedFundInfo: Bool = false
    @State var isNoticedTagLatencyInfo: Bool = false
    
    var body: some View {
        VStack(spacing: 22.5) {
            TodayAccTimeCardView(homeManager: homeViewModel, isNoticed: $isNoticedTagLatencyInfo)
                .padding(.horizontal, 30)
            
            ThisMonthAccTimeCardView(homeManager: homeViewModel, isNoticed: $isNoticedFundInfo)
                .padding(.horizontal, 30)
        }
    }
}

