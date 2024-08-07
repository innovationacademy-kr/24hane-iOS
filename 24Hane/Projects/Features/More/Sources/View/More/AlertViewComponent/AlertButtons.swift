//
//  Buttons.swift
//  24HANE
//
//  Created by Hosung Lim on 4/15/24.
//

import SwiftUI

struct AlertButtonsModifier: ButtonStyle {
    var function: () -> Void
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            function()
        }, label: {
            buildLabel(for: configuration)
        })
    }
    
    private func buildLabel(for configuration: Configuration) -> some View {
        return ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.gradientPurple)
                .frame(width: 250, height: 50)
            configuration.label
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.white)
        }
    }
}



struct AlertSubmitButton: View {
    @ObservedObject var reissue: ReissueVM
    @Binding var showAlert: Bool
    
    func submitReissue() {
        Task {
            do {
                try await reissue.requestReissue()
                reissue.cardReissueState = .apply
            }
        }
        showAlert = false
    }
    
    var body: some View {
        Button {
            
        } label: {
            Text("네, 신청하겠습니다")
        }
        .buttonStyle(AlertButtonsModifier(
            function: submitReissue
        ))
    }
}

struct AlertReceiveButton: View {
    @ObservedObject var reissue: ReissueVM
    @Binding var showAlert: Bool
    
    func receiveReissue() {
        Task {
            do {
                try await reissue.finishReissue()
                reissue.cardReissueState = .done
            } catch {
                reissue.cardReissueState = .pickUpRequested
            }
        }
        showAlert = false
    }
    
    var body: some View {
        Button {
            
        } label: {
            Text("네, 확인했습니다")
        }
        .buttonStyle(
            AlertButtonsModifier(
                function: receiveReissue
            )
        )
    }
}
