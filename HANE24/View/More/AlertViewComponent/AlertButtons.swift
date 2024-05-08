//
//  Buttons.swift
//  24HANE
//
//  Created by Hosung Lim on 4/15/24.
//

import SwiftUI

struct AlertButtonsModifier: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {}, label: {
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
    @EnvironmentObject var reissue: ReissueVM
    @Binding var showAlert: Bool
    var body: some View {
        Button {
            Task {
                do {
                    try await reissue.requestReissue()
                    reissue.cardReissueState = .apply
                }
            }
            showAlert = false
        } label: {
            Text("네, 신청하겠습니다")
        }
        .buttonStyle(AlertButtonsModifier())
    }
}

struct AlertReceiveButton: View {
    @EnvironmentObject var reissue: ReissueVM
    @Binding var showAlert: Bool
    var body: some View {
        Button {
            Task {
                do {
                    try await reissue.finishReissue()
                    reissue.cardReissueState = .done
                } catch {
                    reissue.cardReissueState = .pickUpRequested
                }
            }
            showAlert = false
        } label: {
            Text("네, 확인했습니다")
        }
        .buttonStyle(AlertButtonsModifier())
    }
}

struct AlertPreview: PreviewProvider {
	@State static var showAlert: Bool = false
	static var previews: some View {
		VStack {
			AlertSubmitButton(showAlert: $showAlert)
				.environmentObject(ReissueVM())
			AlertReceiveButton(showAlert: $showAlert)
				.environmentObject(ReissueVM())
		}
	}
}
