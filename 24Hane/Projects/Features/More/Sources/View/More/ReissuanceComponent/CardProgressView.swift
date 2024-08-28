//
//  CardProgressView.swift
//  HANE24
//
//  Created by Katherine JANG on 2/28/23.
//

import SwiftUI

struct CardProgressView: View {
    var item: ProgressItem

    var body: some View {

        HStack(spacing: 15) {
            ZStack {
                Circle()
                    .stroke(lineWidth: 4)
                    .overlay( item.isProcessing ? Circle() : nil)
                    .foregroundColor(item.isProcessing ? .gradientPurple : Color(hex: "EAEAEA"))
                    .frame(width: 50, height: 50)
                Text(item.id)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(item.isProcessing ?  Color(hex: "EAEAEA") : .iconColor)
            }
            VStack(alignment: .leading, spacing: 5) {
                Text(item.title)
                    .foregroundColor(.black)
                    .font(.system(size: 16, weight: .bold))
                Text(item.statement)
                    .foregroundColor(.black)
                    .font(.system(size: 14, weight: .regular))
            }
        }
        .padding()
    }

}

