//
//  PopularMovieCell.swift
//  Zeeflix
//
//  Created by Pyae Phyo Oo on 13/10/2024.
//

import Foundation
import UIKit

class PopularMovieCell : UICollectionViewCell {
    
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var imgMovie: UIImageView!
    
    var popularModel : PopularMovieLocalObject! {
        didSet {
            let image = "https://image.tmdb.org/t/p/w500" + "\(popularModel.image)"
            imgMovie.setImage(with: image)
            lbName.text = popularModel.title
        }
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
}
