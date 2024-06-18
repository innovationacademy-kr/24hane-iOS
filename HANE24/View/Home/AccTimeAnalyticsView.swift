//
//  AccTimeAnalyticsView.swift
//  24HANE
//
//  Created by Katherine JANG on 6/18/24.
//

import SwiftUI

struct AccTimeAnalyticsView: View {
    @ObservedObject var homeViewModel: HomeViewModel
    
    var body: some View {
        TabView {
            ChartView(item: ChartItem(id: "주", title: "최근 주간 그래프", period: homeViewModel.getWeeklyPeriod(), data: homeViewModel.accumulationTimes.sixWeekAccumulationTime))
                .padding(.horizontal, 10)
            ChartView(item: ChartItem(id: "개월", title: "최근 월간 그래프", period: homeViewModel.getMonthlyPeriod(), data: homeViewModel.accumulationTimes.sixMonthAccumulationTime))
                .padding(.horizontal, 10)
        }
        .tabViewStyle(.page)
        .frame(height: 289)
    }
}
