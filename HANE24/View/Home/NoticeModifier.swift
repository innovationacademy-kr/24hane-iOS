//
//  NoticeModifier.swift
//  24HANE
//
//  Created by Katherine JANG on 3/27/24.
//

import SwiftUI

//MARK: unused in V3
public struct NoticeModifier: ViewModifier {
	@Binding var isPresent: Bool
	
	let notice: NoticeView
	
	public func body(content: Content) -> some View {
		content
			.fullScreenCover(isPresented: $isPresent) {
				notice
			}
			.transaction { transaction in
				transaction.disablesAnimations = true
			}
	}
}

extension View {
	public func noticeAlert(isPresented: Binding<Bool>, noticeAlert: @escaping () -> NoticeView) -> some View {
		return modifier(NoticeModifier(isPresent: isPresented, notice: noticeAlert()))
	}
}
