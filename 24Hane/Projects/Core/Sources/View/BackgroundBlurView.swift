//
//  BackgroundBlurView.swift
//  HaneCore
//
//  Created by Katherine JANG on 8/7/24.
//

import SwiftUI
import UIKit

public struct BackgroundBlurView: UIViewRepresentable {
    
    public init() {}
    
    public func makeUIView(context: Context) -> UIView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = .clear
        }
        return view
    }

    public func updateUIView(_ uiView: UIView, context: Context) {}
}
