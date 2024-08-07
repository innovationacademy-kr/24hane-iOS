//
//  HomeView.swift
//  HANE24
//
//  Created by Katherine JANG on 2/13/23.
//

import SwiftUI
import HaneCore

public struct HomeView: View {
    @StateObject var homeViewModel = HomeViewModel()
    
    public init() {}
    
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
        .task {
            await homeViewModel.refresh()
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


struct BackgroundBlurView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = .clear
        }
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}
