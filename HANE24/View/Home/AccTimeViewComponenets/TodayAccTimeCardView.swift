//
//  TodayAccTimeCardView.swift
//  HANE24
//
//  Created by Yunki on 2023/02/14.
//

import SwiftUI

struct TodayAccTimeCardView: View {
    @ObservedObject var homeManager: HomeViewModel
    
    @AppStorage("DailySelectionOption") private var dailySelectionOption =  UserDefaults.standard.integer(forKey: "DailySelectionOption")
    
    @State var isFold: Bool = true
    @State var drawingStroke = false
    
    @Binding var isNoticed: Bool
    
    let options: [Double] = (4...24).map { Double($0) }
    
    let animation = Animation.easeOut(duration: 0.8).delay(0.1)
    
    var body: some View {
        FoldableView(title: "이용시간",
                     time: homeManager.accumulationTimes.todayAccumulationTime,
                     color: .white,
                     height: 180,
                     isFold: $isFold) {
            HStack(alignment: .center, spacing: 0) {
                Text("목표 시간")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.black)
                //                    .padding(10)
                
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
            //            .padding(.leading, 10)
            //            .padding(.trailing, 14)
            /// Progress Circle
            CircularProgressBar(drawingStroke: $drawingStroke, objectiveTime: options[dailySelectionOption], progressiveTime: Double(homeManager.dailyAccumulationTime))
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

extension View {
    /// Hide or show the view based on a boolean value.
    ///
    /// Example for visibility:
    ///
    ///     Text("Label")
    ///         .isHidden(true)
    ///
    /// Example for complete removal:
    ///
    ///     Text("Label")
    ///         .isHidden(true, remove: true)
    ///
    /// - Parameters:
    ///   - hidden: Set to `false` to show the view. Set to `true` to hide the view.
    ///   - remove: Boolean value indicating whether or not to remove the view.
    @ViewBuilder func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
        if hidden {
            if !remove {
                self.hidden()
            }
        } else {
            self
        }
    }
}

