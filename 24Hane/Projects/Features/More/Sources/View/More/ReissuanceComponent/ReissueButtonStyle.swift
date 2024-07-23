//
//  ReissueButtonStyle.swift
//  More
//
//  Created by Hosung Lim on 7/23/24.
//

import SwiftUI

struct ReissueButtonStyle: ButtonStyle {
    var cardReissueState: CardState
    @Binding var showAlert: Bool
    var isReceiveButton: Bool

    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            showAlert = true
        }) {
            buildLabel(for: configuration)
        }
    }

    private func buildLabel(for configuration: ButtonStyle.Configuration) -> some View {
        let foregroundColor = getForegroundColor(for: cardReissueState)

        return ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(foregroundColor)
                .frame(height: 45)
            configuration.label
                .foregroundColor(.white)
                .font(.system(size: 16, weight: .bold))
        }
    }

    private func getForegroundColor(for state: CardState) -> Color {
        if isReceiveButton == true {
            switch state {
            case .pickUpRequested:
                return .gradientPurple
            default:
                return .iconColor
            }
        } else {
            switch state {
            case .none, .done:
                return .gradientPurple
            default:
                return .textGrayMoreView
            }
        }
    }
}
