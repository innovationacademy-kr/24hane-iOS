//
//  HomeView.swift
//  HANE24
//
//  Created by Katherine JANG on 2/13/23.
//

import Foundation
import SwiftUI
import HaneCore
import UIKit


struct HomeView: View {

    @State var test: Bool = true
    @Environment(\.colorScheme) var colorScheme

    @ObservedObject var homeManager: HomeVM

    var body: some View {
        ZStack {
            if homeManager.isInCluster {
                Image("Background")
                    .resizable()
                    .edgesIgnoringSafeArea(.top)
                    .opacity(0.7)
            } else {
                Theme.backgroundColor(forScheme: colorScheme)
                    .edgesIgnoringSafeArea(colorScheme == .dark ? .all : .top)
            }
            VStack(alignment: .center, spacing: 20) {
                HomeHeaderView(homeManager: homeManager)
                ScrollView {
                    PullToRefresh(coordinateSpaceName: "pullToRefresh") {
                        Task {
                            try await homeManager.refresh()
                        }
                    }

                    VStack(spacing: 22.5) {
                        TodayAccTimeCardView(homeManager: homeManager, isNoticed: $isNoticedTagLatencyInfo)
//                            .padding(.horizontal, 30)

                        ThisMonthAccTimeCardView(homeManager: homeManager, isNoticed: $isNoticedFundInfo)
//                            .padding(.horizontal, 30)

                        TabView {
                            ChartView(item: ChartItem(id: "주", title: "최근 주간 그래프", period: homeManager.getWeeklyPeriod(), data: homeManager.accumulationTimes.sixWeekAccumulationTime))
//                                .padding(.horizontal, 10)
                            ChartView(item: ChartItem(id: "개월", title: "최근 월간 그래프", period: homeManager.getMonthlyPeriod(), data: homeManager.accumulationTimes.sixMonthAccumulationTime))
//                                .padding(.horizontal, 10)
                        }
//                        .padding(.horizontal, 20)
                        .tabViewStyle(.page)
                        .frame(height: 289)
                        PopulationView(population: homeManager.mainInfo.gaepo)
//                            .padding(.horizontal, 30)
                    }
                    .padding(EdgeInsets(top: 10, leading: 30, bottom: 30, trailing: 30))
//                    .padding(.bottom, 30)
//                    .padding(.top, 10)
//                    .padding(.horizontal, 30)
                } .coordinateSpace(name: "pullToRefresh")
            }
        }
    }
}

