//
//  ReissuanceView.swift
//  HANE24
//
//  Created by Katherine JANG on 2/15/23.
//

import SwiftUI

struct ReissuanceView: View {
    @GestureState private var dragOffset = CGSize.zero
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.openURL) private var openURL
	@EnvironmentObject var reissue: ReissueVM

    @State var showAlert = false

    var body: some View {
        ZStack(alignment: .topLeading) {
            Theme.backgroundColor(forScheme: colorScheme)
                .ignoresSafeArea()
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)

            VStack {
				Tapbar()

                VStack(spacing: 15) {
					HowToReissue()

					ProgressToReissue(cardReissueState: reissue.cardReissueState)

                    Spacer()
                    if reissue.cardReissueState != .pickUpRequested {
                        ReissueButton(
							cardReissueState: reissue.cardReissueState,
							showAlert: $showAlert)
                    } else {
                        ReceiveButton(
							cardReissueState: reissue.cardReissueState,
							showAlert: $showAlert)
                    }
                }
                .padding(.horizontal, 30)
                .padding(.bottom, 30)
            }
            if showAlert {
                AlertView(showAlert: $showAlert, item: (reissue.cardReissueState == .pickUpRequested) ? items[1] : items[0])
            }
        }
        .gesture(DragGesture().updating($dragOffset) { (value, _, _) in
            if value.startLocation.x < 30 && value.translation.width > 100 {
                self.presentationMode.wrappedValue.dismiss()
            }
        })
    }
}

struct ReissuanceView_Previews: PreviewProvider {
    static var previews: some View {
        ReissuanceView()
			.environmentObject(ReissueVM())
    }
}
