//
//  UIimage.swift
//  Zeeflix
//
//  Created by Pyae Phyo Oo on 13/10/2024.
//

import Foundation
import Kingfisher

extension UIImageView {
    
    func setImage(with urlString: String) {
        guard let url = URL(string: urlString) else { return }
        kf.indicatorType = .activity
        kf.setImage(with: url, options: [
            .transition(ImageTransition.fade(0.3)),
            .forceTransition
        ]
        )
    }
}
