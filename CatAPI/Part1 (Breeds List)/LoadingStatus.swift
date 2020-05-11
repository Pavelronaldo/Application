//
//  LoadingStatus.swift
//  CatAPI
//
//  Created by Pavel Ronaldo on 5/2/20.
//  Copyright © 2020 Pavel Ronaldo. All rights reserved.
//

import UIKit

class LoadingStatus: NSObject {
    var loadingIndicator: UIActivityIndicatorView?
    
    init(_ attachView: UIView) {
        let screen = UIScreen.main.bounds
        self.loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: screen.width/2-22, y: 400, width: 44, height: 44))
        self.loadingIndicator?.style = .white
        self.loadingIndicator?.hidesWhenStopped = true
        self.loadingIndicator?.stopAnimating()
        attachView.addSubview(self.loadingIndicator!)
    }
    
    func show() {
        self.loadingIndicator?.startAnimating()
    }
    
    func dismis() {
        self.loadingIndicator?.stopAnimating()
        self.loadingIndicator?.removeFromSuperview()
        self.loadingIndicator = nil
    }
}
