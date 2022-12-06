//
//  LoadingScreeen.swift
//  Movie-Trending-Week
//
//  Created by Émerson M Luz on 06/12/22.
//

import UIKit

struct LoadingScreen {
    static func startLoading (loadingActivity: UIActivityIndicatorView, loadingView: UIView) {
        loadingView.isHidden = false
        loadingActivity.startAnimating()
    }
    
    static func stopLoading (loadingActivity: UIActivityIndicatorView, loadingView: UIView) {
        loadingActivity.stopAnimating()
        loadingView.isHidden = true
    }
}

