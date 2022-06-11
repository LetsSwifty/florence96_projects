//
//  ActivityIndicatorManager.swift
//  Gallery
//
//  Created by Yejin Hong on 2022/06/11.
//

import UIKit

class ActivityIndicatorAPI {
    static var alpha = 1.0
    
    static func showLoading(view: UIView) {
        guard let window = view.window?.windowScene?.keyWindow else { return }
        
        let indicatorView: UIActivityIndicatorView
        
        if let existedView = window.subviews.first(where: { $0 is UIActivityIndicatorView }) as? UIActivityIndicatorView {
            indicatorView = existedView
        } else {
            indicatorView = UIActivityIndicatorView(style: .large)
            indicatorView.frame = window.frame
            indicatorView.alpha = alpha
            window.addSubview(indicatorView)
            window.bringSubviewToFront(indicatorView)
        }
        indicatorView.startAnimating()
    }
    
    static func hideLoading(view: UIView) {
        DispatchQueue.main.async {
            guard let window = view.window?.windowScene?.keyWindow else { return }
            
            window.subviews.filter({ $0 is UIActivityIndicatorView }).forEach { $0.removeFromSuperview() }
        }
    }
}
