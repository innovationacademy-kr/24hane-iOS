//
//  TodayAccTimeCardView.swift
//  HANE24
//
//  Created by Yunki on 2023/02/14.
//

import SwiftUI
import HaneCore
import Combine

struct TodayAccTimeCardView: View {
    @ObservedObject var homeViewModel: HomeViewModel
    
    @AppStorage("DailySelectionOption") private var dailySelectionOption =  UserDefaults.standard.integer(forKey: "DailySelectionOption")
    
    @State var isFold: Bool = true
    @State var drawingStroke = true
    @State var percentage: Int = 0
    
    let options: [Double] = (4...24).map { Double($0) }
    
    let animation = Animation.easeOut(duration: 0.8).delay(0.1)
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.white)

            VStack(spacing: 0) {
                /// First Line
                HStack(alignment: .center, spacing: 0) {
                    Button {
                        if !homeViewModel.isLoading {
                            homeViewModel.showModal = .dailyTime
                        }
                    } label: {
                        HStack(spacing: 6) {
                            Text("이용 시간")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(.black)
                            Image(systemName: "exclamationmark.circle")
                                .foregroundStyle(Color(hex: "#9B9797"))
                                .font(.system(size: 12))
                        }
                        .padding(10)
                    }

                    Button {
                        withAnimation {
                            isFold.toggle()
                            drawingStroke = false
                        }
                    } label: {
                        HStack(spacing: 10) {
                            Spacer()

                            if homeViewModel.isLoading {
                                LoadingAnimation()
                            } else {
                                HStack(alignment: .bottom, spacing: 0) {
                                    Text("\(homeViewModel.dailyAccumulationTime / 3600)")
                                        .font(.system(size: 20, weight: .bold))
                                    Text("시간 ")
                                        .font(.system(size: 16, weight: .bold))
                                    Text("\(homeViewModel.dailyAccumulationTime % 3600 / 60)")
                                        .font(.system(size: 20, weight: .bold))
                                    Text("분")
                                        .font(.system(size: 16, weight: .bold))
                                }
                            }

                            Image(systemName: "chevron.right")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundStyle(Color(hex: "#9B9797"))
                                .rotationEffect(isFold ? Angle(degrees: 0) : Angle(degrees: 90))
                                .frame(width: 24, height: 24)
                                .isHidden(homeViewModel.isLoading)
                        }
                        .foregroundColor(.black)
                    }
                }
                .padding(.leading, 10)
                .padding(.trailing, 14)

                if !isFold {
                    /// Second Line
                    HStack(alignment: .center, spacing: 0) {
                        Text("목표 시간")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.black)
                            .padding(10)
//                            .padding(.leading, 18)

                        Spacer()

                        Menu {
                            Picker(selection: $dailySelectionOption) {
                                ForEach(0..<options.count, id: \.self) { times in
                                    Text("\(Int(options[times])) 시간")
                                }
                            } label: {}.onChange(of: dailySelectionOption) { selection in
                                UserDefaults.standard.setValue(selection, forKey: "DailySelectionOption")
                            }
                        } label: {
                            HStack(spacing: 0) {
                                Text("\(Int(options[dailySelectionOption]))")
                                    .font(.system(size: 20, weight: .bold))
                                Text("시간")
                                    .font(.system(size: 16, weight: .bold))
                                    .padding(.trailing, 10)
                                Image(systemName: "chevron.down")
                                    .frame(width: 24, height: 24)
                                    .hidden()
                            }
                            .foregroundStyle(.black)
                        }
                    }
                    .padding(.leading, 10)
                    .padding(.trailing, 14)
                    /// Progress Circle
                    CircularProgressBar(drawingStroke: $drawingStroke, percentage: $percentage)
                        .frame(width: 112, height: 112)
                        .padding(.top, 11)
                        .padding(.bottom, 18)
                        .animation(animation, value: drawingStroke)
                        .onAppear {
                            drawingStroke = true
                        }
                }
            }
        }
        .frame(height: isFold ? 80 : 260, alignment: .top)
        .onChange(of: homeViewModel.dailyAccumulationTime) { _ in
            self.percentage = Int(Double(homeViewModel.dailyAccumulationTime) / Double(options[dailySelectionOption] * 3600) * 100)
        }
    }
}
