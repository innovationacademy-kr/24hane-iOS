//
//  ReissueButton.swift
//  24HANE
//
//  Created by Hosung Lim on 4/15/24.
//

import SwiftUI

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
