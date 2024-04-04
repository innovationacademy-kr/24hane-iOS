//
//  HomeView.swift
//  HANE24
//
//  Created by Katherine JANG on 2/13/23.
//

import SwiftUI

struct HomeView: View {
    init(fundInfo: Binding<Bool>, tagLatencyInfo: Binding<Bool>) {
//        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(Color.gradientPurple)
//        UIPageControl.appearance().pageIndicatorTintColor = UIColor.gray.withAlphaComponent(0.2)

        self._isNoticedFundInfo = fundInfo
        self._isNoticedTagLatencyInfo = tagLatencyInfo
    }
    @State var test: Bool = true
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var hane: Hane
	
	@StateObject var homeManager = HomeVM()

    @Binding var isNoticedFundInfo: Bool
    @Binding var isNoticedTagLatencyInfo: Bool

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
                    HStack(alignment: .center) {
                        if homeManager.profileImage != "" {
                            AsyncImage(url: URL(string: hane.profileImage)) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 28, height: 28)
                                    .clipShape(Circle())
                                    .padding(.trailing, 3)
                            } placeholder: {
                                Image(systemName: "person.circle")
                                    .resizable()
                                    .frame(width: 28, height: 28)
                                    .padding(.trailing, 3)
                                    .foregroundColor(.iconColor)
                            }
                        } else {
                            Image(systemName: "person.circle")
                                .resizable()
                                .frame(width: 28, height: 28)
                                .padding(.trailing, 3)
                                .foregroundColor(.iconColor)
                        }

                        Text(homeManager.userID)
                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                            .foregroundColor(!hane.isInCluster && colorScheme == .light ? .black : .white)

                        if homeManager.isInCluster {
                            Circle()
                                .foregroundColor(.green)
                                .frame(width: 8, height: 8)
                                .padding(.bottom, 10)
                                .padding(.leading, 0)
                        }

                        Spacer()
                    }
                    .padding(.top, 20)
                    .frame(height: 30)
                    .padding(.horizontal, 30)

                    ScrollView {
                        PullToRefresh(coordinateSpaceName: "pullToRefresh") {
                            Task {
                                try await hane.refresh()
                            }
                        }

                        VStack(spacing: 22.5) {
							TodayAccTimeCardView(homeManager: homeManager, isNoticed: $isNoticedTagLatencyInfo)
                                .padding(.horizontal, 30)

							ThisMonthAccTimeCardView(homeManager: homeManager, isNoticed: $isNoticedFundInfo)
                                .padding(.horizontal, 30)

                            TabView {
								ChartView(item: ChartItem(id: "주", title: "최근 주간 그래프", period: getWeeklyPeriod(), data: homeManager.sixWeekAccumulationTime))
                                    .padding(.horizontal, 10)
								ChartView(item: ChartItem(id: "개월", title: "최근 월간 그래프", period: getMonthlyPeriod(), data: homeManager.sixMonthAccumulationTime))
                                    .padding(.horizontal, 10)
                            }
                            .padding(.horizontal, 20)
                            .tabViewStyle(.page)
                            .frame(height: 289)

							PopulationView(population: homeManager.clusterPopulation)
                                .padding(.horizontal, 30)
                        }
                        .padding(.bottom, 30)
                        .padding(.top, 10)
                    } .coordinateSpace(name: "pullToRefresh")
                }
            }
		}
    }
	
	private func getWeeklyPeriod() -> [String] {
		var weeklyPeriod: [String] = []
		var date = Date()
		let formatter = DateFormatter()
		formatter.locale = Locale(identifier: "ko_KR")
		formatter.dateFormat = "M.dd(EEE)"
		for _ in 0..<6 {
			let startDay = formatter.string(from: date.startOfWeek!)
			let endDay = formatter.string(from: date.endOfWeek!)
			let period = startDay + " - " + endDay
			weeklyPeriod.append(period)
			date = Calendar.current.date(byAdding: .weekOfYear, value: -1, to: date)!
		}
		return weeklyPeriod
	}

	private func getMonthlyPeriod() -> [String] {
		var monthlyPeriod: [String] = []
		var date = Date()
		let formatter = DateFormatter()
		formatter.dateFormat = "YYYY.M"
		for _ in 0..<6 {
			let period = formatter.string(from: date)
			monthlyPeriod.append(period)
			date = Calendar.current.date(byAdding: .month, value: -1, to: date)!
		}
		return monthlyPeriod
	}
}

#Preview {
    HomeView(fundInfo: .constant(false), tagLatencyInfo: .constant(false))
        .environmentObject(Hane())
}
