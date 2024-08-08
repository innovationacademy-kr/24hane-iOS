//
//  HomeView.swift
//  HANE24
//
//  Created by Katherine JANG on 2/13/23.
//

import SwiftUI
import UIKit
import HaneCore

public struct HomeView: View {
    @ObservedObject var homeViewModel: HomeViewModel
    
    public init() {
        self.homeViewModel = HomeViewModel()
    }
    
    public var body: some View {
        ZStack {
            BackgroundTheme(isInCluster: $homeViewModel.isInCluster)
            
            VStack(alignment: .center, spacing: 20) {
                HomeHeaderView(homeViewModel: homeViewModel)
                ScrollView {
                    PullToRefresh(coordinateSpaceName: "pullToRefresh") {
                        Task {
                            await homeViewModel.refresh()
                        }
                    }
                    VStack(spacing: 22.5) {
                        AccTimeView(homeViewModel: homeViewModel)
                        AccTimeAnalyticsView(homeViewModel: homeViewModel)
                        PopulationView(population: homeViewModel.mainInfo.gaepo)
                            .padding(.horizontal, 30)
                    }
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 30, trailing: 0))
                } .coordinateSpace(name: "pullToRefresh")
            }
        }
        .onAppear {
            Task {
                await homeViewModel.refresh()
            }
        }
        .fullScreenCover(isPresented: Binding<Bool>(
            get: { homeViewModel.showModal != .none },
            set: { newValue in
                if !newValue {
                    homeViewModel.showModal = .none
                }
            }
        )) {
            NoticeView(showNotice: $homeViewModel.showModal, notice: homeViewModel.getInfoMessage())
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(BackgroundBlurView())
                .ignoresSafeArea()
        }
    }
}
