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
    @Binding var isFold: Bool
    let content: Content

    init(title: String, time: Int64, color: Color, isFold: Binding<Bool>, @ViewBuilder content: () -> Content) {
        self.title = title
        self.time = time
        self.color = color
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
                            .foregroundColor(isFold ? .white : .black)

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
                        .foregroundColor(isFold ? .white : .black)

                        Image(systemName: "chevron.right")
                            .chevronStyle(pointDown: isFold)
                    }
                }
                //                    .padding(.leading, 20)
                //                    .padding(.trailing, 14)
                //                    .padding(.vertical, 10)
                //                    .animation(nil, value: isFold)

                if !isFold {
                    content
                }
            }
            .padding()
        }
        .frame(height: isFold ? 80 : 260, alignment: .top)
    }
}
