//
//  Dialogs.swift
//  Zeeflix
//
//  Created by Pyae Phyo Oo on 13/10/2024.
//

import Foundation
import UIKit

class AlertDialogVC: UIViewController {

    @IBOutlet weak var viewBg: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var btnOK: UIButton!
    
    var action: (() -> Void)?
    var alertTitle: String = ""
    var okBtnText: String = ""
    var message: String = ""
    
    static func newInstance(title: String = "", message: String, okButtonText: String = "OK",  action: (() -> Void)?) -> AlertDialogVC {
        let vc = AlertDialogVC.initiate(appStoryBoard: .Dialogs)
        vc.alertTitle = title
        vc.message = message
        vc.okBtnText = okButtonText
        vc.action = action
        
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overCurrentContext
        
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblTitle.text = alertTitle
        lblMessage.text = message
        btnOK.setTitle(okBtnText, for: .normal)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
    }
    
    @IBAction func didTappedOK(_ sender: Any) {
        self.dismiss(animated: true) {
            self.action?()
        }
    }
}
