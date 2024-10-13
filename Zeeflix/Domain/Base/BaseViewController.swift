//
//  BaseViewController.swift
//  Zeeflix
//
//  Created by Pyae Phyo Oo on 13/10/2024.
//

import Foundation
import UIKit
import ANActivityIndicator
import Reachability

class BaseViewController: UIViewController {
    
    var reachability = BaseReachabilityHandler()
    var statusObservation: NSKeyValueObservation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    public func showLoading() {
        let indicatorWidth = view.frame.width * 0.2
        showIndicator(
            CGSize(width: indicatorWidth, height: indicatorWidth),
            message: "Loading...",
            messageTopMargin: CGFloat(12),
            animationType: .ballClipRotate,
            color: .lightGray,
            padding: CGFloat(12))
    }

    public func hideLoading() {
        hideIndicator()
    }

    public func loading(_ status: Bool) {
        status ? showLoading() : hideLoading()
    }

    public func showError(msg: String) {
        let vc = AlertDialogVC.newInstance(title: "Error", message: msg, okButtonText: "OK", action: nil)
        self.present(vc, animated: true, completion: nil)
    }
}
