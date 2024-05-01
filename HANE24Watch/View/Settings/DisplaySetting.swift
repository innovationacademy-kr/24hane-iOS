//
//  SwiftUIView.swift
//  HANE24Watch
//
//  Created by Hosung Lim on 5/1/24.
//

import SwiftUI

struct RadioButton: View {
    let label: String
    let key: Int
    @Binding var selectedIndex: Int
    var body: some View {
        ZStack {
            selectedIndex == key ? Color.gray.opacity(0.2) : Color.clear
            HStack {
                Text(label)
                
                Spacer()
                
                ZStack {
                    Circle()
                        .stroke(style: /*@START_MENU_TOKEN@*/StrokeStyle()/*@END_MENU_TOKEN@*/)
                        .frame(width: 20, height: 20)
                    
                    if selectedIndex == key {
                        Circle()
                            .fill(Color.green)
                            .frame(width: 12, height: 12)
                    }
                }
            }
            .padding(16)
            .contentShape(Rectangle())
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white,lineWidth: 1))
        }
        .onTapGesture {
            selectedIndex = key
        }
    }
}

struct DisplaySettingView: View {
    let displayOptions: [Int: String] = [
        0: "누적/인증 시간",
        1: "목표 시간"
    ]
    
    @State private var selectedIndex = 0
    
    var body: some View {
        VStack(alignment: .center) {
            Text("옵션을 선택하세요")
                .font(.title3)
                .padding(16)
            
            Text("\(selectedIndex)")
            
            ForEach(displayOptions.sorted(by: <), id: \.key) { item in
                RadioButton(label: item.value, key: item.key, selectedIndex: $selectedIndex)
            }
            Spacer()
        }
    }
}
#Preview {
    DisplaySettingView()
}
