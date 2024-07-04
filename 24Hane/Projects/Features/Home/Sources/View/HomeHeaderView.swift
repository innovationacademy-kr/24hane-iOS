//
//  HeaderView.swift
//  24HANE
//
//  Created by Katherine JANG on 3/26/24.
//

import SwiftUI

struct HomeHeaderView: View {
	@Environment(\.colorScheme) var colorScheme
    @ObservedObject var homeViewModel: HomeViewModel

    var body: some View {
		VStack(alignment: .center, spacing: 20) {
			HStack(alignment: .center) {
                if homeViewModel.mainInfo.profileImage != "" {
                    AsyncImage(url: URL(string: homeViewModel.mainInfo.profileImage)) { image in
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
			
                Text(homeViewModel.mainInfo.login)
					.font(.system(size: 20, weight: .semibold, design: .rounded))
					.foregroundColor(!homeViewModel.isInCluster && colorScheme == .light ? .black : .white)
			
				if homeViewModel.isInCluster {
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
		}

    }
}

#Preview {
    @StateObject var homeVM = HomeViewModel()
    
    return HomeHeaderView(homeViewModel: homeVM)
}
