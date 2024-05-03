//
//  HeaderView.swift
//  24HANE
//
//  Created by Katherine JANG on 3/26/24.
//

import SwiftUI

struct HeaderView: View {
	@Environment(\.colorScheme) var colorScheme
    @ObservedObject var homeManager: HomeVM

    var body: some View {
		VStack(alignment: .center, spacing: 20) {
			HStack(alignment: .center) {
                if homeManager.mainInfo.profileImage != "" {
                    AsyncImage(url: URL(string: homeManager.mainInfo.profileImage)) { image in
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
			
                Text(homeManager.mainInfo.login)
					.font(.system(size: 20, weight: .semibold, design: .rounded))
					.foregroundColor(!homeManager.isInCluster && colorScheme == .light ? .black : .white)
			
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
		}

    }
}

#Preview {
    @StateObject var homeVM = HomeVM()
    
    return HeaderView(homeManager: homeVM)
}
