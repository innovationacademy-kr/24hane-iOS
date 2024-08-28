//
//  ReceiveButton.swift
//  More
//
//  Created by Hosung Lim on 7/23/24.
//

import SwiftUI

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
