//
//  ThisMonthAccTimeCardView.swift
//  24HANE
//
//  Created by Yunki H on 12/12/23.
//

import SwiftUI

struct ThisMonthAccTimeCardView: View {
	@ObservedObject var homeViewModel: HomeViewModel

    @Binding var isNoticed: Bool

    @State var isFold: Bool = true

    var body: some View {
        FoldableView(title: "월 누적 시간",
                     time: homeViewModel.accumulationTimes.monthAccumulationTime,
                     color: Color(hex: "#735BF2"),
                     isFold: $isFold) {
            HStack(spacing: 0) {
                Button {
                    if !homeViewModel.isLoading {
                        isNoticed = true
                    }
                } label: {
                    HStack(spacing: 2) {
                        Image(systemName: "exclamationmark.circle")
                            .foregroundStyle(Color(hex: "#9B9797"))
                            .frame(width: 16, height: 16)
                        Text("인정 시간")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(Color(hex: "#735BF2"))
                    }
                    .padding(10)
                }
                
                Spacer()
                
                HStack(spacing: 10) {
                    Spacer()
                    
                    if homeViewModel.isLoading {
                        LoadingAnimation()
                    } else {
                        // TODO: hane -> homeVM
                        HStack(alignment: .bottom, spacing: 0) {
                            Text("\(homeViewModel.accumulationTimes.monthAccumulationTime / 3600)")
                                .font(.system(size: 20, weight: .bold))
                            Text("시간 ")
                                .font(.system(size: 16, weight: .bold))
                            Text("\(homeViewModel.accumulationTimes.monthAccumulationTime % 3600 / 60)")
                                .font(.system(size: 20, weight: .bold))
                            Text("분")
                                .font(.system(size: 16, weight: .bold))
                        }
                    }
                    
                    Image(systemName: "chevron.right")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(.clear)
                        .rotationEffect(isFold ? Angle(degrees: 0) : Angle(degrees: 90))
                        .frame(width: 24, height: 24)
                        .isHidden(homeViewModel.isLoading)
                }
                .foregroundColor(Color(hex: "#735BF2"))
            }
            
        }
    }
//                    .padding(.leading, 10)
//                    .padding(.trailing, 14)
//                }
//            }
//        }
//        .frame(height: isFold ? 80 : 120)
//    }
}
