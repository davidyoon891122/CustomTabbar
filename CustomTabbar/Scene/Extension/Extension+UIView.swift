//
//  Extension+UIView.swift
//  CustomTabbar
//
//  Created by jiwon Yoon on 2023/05/11.
//

import UIKit

#if canImport(SwiftUI) && DEBUG
import SwiftUI
extension UIView {
    struct UIViewPreview<View: UIView>: UIViewRepresentable {
        let view: View
        
        init(_ builder: @escaping () -> View) {
            view = builder()
        }
        
        func makeUIView(context: Context) -> UIView {
            return view
        }
        
        func updateUIView(_ view: UIView, context: Context) {
            view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
            view.setContentHuggingPriority(.defaultHigh, for: .vertical)
        }
    }
}


#endif
