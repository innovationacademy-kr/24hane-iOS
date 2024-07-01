//
//  ReissueButton.swift
//  24HANE
//
//  Created by Hosung Lim on 4/15/24.
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

struct ReissueButton: View {
    var cardReissueState: CardState
    @Binding var showAlert: Bool

    var body: some View {
        Button(action: {}) {
            Text("카드 신청하기")
        }
        .buttonStyle(
            ReissueButtonStyle(
                cardReissueState: cardReissueState, 
                showAlert: $showAlert,
                isReceiveButton: false
            ))
        .disabled((cardReissueState != .none && cardReissueState != .done))
    }
}

struct ReceiveButton: View {
    var cardReissueState: CardState
    @Binding var showAlert: Bool

    var body: some View {
        Button(action: {}) {
            Text("데스크 카드 수령 완료")
        }
        .buttonStyle(
            ReissueButtonStyle(
                cardReissueState: cardReissueState,
                showAlert: $showAlert,
                isReceiveButton: true
            )
        )
    }
}

struct Preview: PreviewProvider {
    @State static var showAlert: Bool = false
    static var previews: some View {
        VStack {
            Spacer()
            VStack(spacing: 10) {
                ReissueButton(
                    cardReissueState: .none, showAlert: $showAlert
                )
                ReissueButton(
                    cardReissueState: .inProgress, showAlert: $showAlert
                )
            }
            Spacer()
            VStack(spacing: 10) {
                ReceiveButton(
                    cardReissueState: .pickUpRequested, showAlert: $showAlert
                )
                ReceiveButton(
                    cardReissueState: .done, showAlert: $showAlert
                )
            }
            Spacer()
        }
    }
}
