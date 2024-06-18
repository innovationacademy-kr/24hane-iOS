//
//  HomeView.swift
//  HANE24
//
//  Created by Katherine JANG on 2/13/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var homeViewModel = HomeViewModel()
    @State var test: Bool = true
    @Binding var isNoticedFundInfo: Bool
    @Binding var isNoticedTagLatencyInfo: Bool

    var body: some View {
        ZStack {
            BackgroundTheme(isInCluster: homeViewModel.isInCluster)
            
            VStack(alignment: .center, spacing: 20) {
                HomeHeaderView(homeViewModel: homeViewModel)
                ScrollView {
                    PullToRefresh(coordinateSpaceName: "pullToRefresh") {
                        Task {
                            try await homeViewModel.refresh()
                        }
                    }
                    VStack(spacing: 22.5) {
                        AccTimeView(homeViewModel: homeViewModel)
                        AccTimeAnalyticsView(homeViewModel: homeViewModel)
                        PopulationView(population: homeViewModel.mainInfo.gaepo)
                            .padding(.horizontal, 30)
                    }
                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 30, trailing: 20))
                } .coordinateSpace(name: "pullToRefresh")
            }
        }
    }
}

