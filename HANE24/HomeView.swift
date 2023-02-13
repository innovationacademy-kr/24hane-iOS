//
//  HomeView.swift
//  HANE24
//
//  Created by Katherine JANG on 2/13/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack{
            Color.defaultBG
            VStack{
                HStack{
                    Image(systemName: "person")
                    Text("hejang")
                        .fontWeight(.semibold)
                    Text("님")
                        .fontWeight(.light)
                    Spacer()
                    Image(systemName: "bell")
                }
                .padding()
                TabView{
                    ChartView()
                    ChartView()
                }
                .tabViewStyle(.page)
                .indexViewStyle(.page(backgroundDisplayMode: .always))
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
