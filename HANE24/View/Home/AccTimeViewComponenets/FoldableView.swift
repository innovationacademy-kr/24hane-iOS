//
//  FoldableView.swift
//  24HANE
//
//  Created by Katherine JANG on 6/18/24.
//

import SwiftUI

struct FoldableView<Content: View>: View {
    let title: String
    let time: Int64
    let color: Color
    let height: CGFloat
    @Binding var isFold: Bool
    let content: Content
    
    init(title: String, time: Int64, color: Color, height: Int, isFold: Binding<Bool>, @ViewBuilder content: () -> Content) {
        self.title = title
        self.time = time
        self.color = color
        self.height = CGFloat(height)
        self._isFold = isFold
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(isFold ? color : .white)
            
            VStack(spacing: 0) {
                Button {
                    withAnimation {
                        isFold.toggle()
                    }
                } label: {
                    HStack(spacing: 10) {
                        Text(title)
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(isFold && color != .white ? .white : .black)
                        
                        Spacer()
                        
                        HStack(alignment: .bottom, spacing: 0) {
                            Text("\(time / 3600)")
                                .font(.system(size: 20, weight: .bold))
                            Text("시간 ")
                                .font(.system(size: 16, weight: .bold))
                            Text("\(time % 3600 / 60)")
                                .font(.system(size: 20, weight: .bold))
                            Text("분")
                                .font(.system(size: 16, weight: .bold))
                        }
                        .foregroundColor(isFold && color != .white ? .white : .black)
                        
                        Image(systemName: "chevron.right")
                            .chevronStyle(pointDown: isFold)
                    }
                }
                .padding(.vertical, 10)
                
                if !isFold {
                    content
                }
            }
            .padding()
        }
        .frame(height: isFold ? 80 : height, alignment: .top)
        .padding(.bottom, isFold ? 0 : 30.5)
    }
}
