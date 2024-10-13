//
//  MovieCell.swift
//  Zeeflix
//
//  Created by Pyae Phyo Oo on 13/10/2024.
//

import Foundation
import UIKit

protocol MovieCellDelegate {
    func onTapAdd(cell: MovieCell, upcomingLocal: UpcomingMovieLocalObject)
}

class MovieCell : UITableViewCell {
    
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var imgMovie: UIImageView!
    @IBOutlet weak var favBtn: UIButton!
    
    var upcomingModel : UpcomingMovieLocalObject! {
        didSet {
            let image = "https://image.tmdb.org/t/p/w500" + "\(upcomingModel.image)"
            imgMovie.setImage(with: image)
            lbName.text = upcomingModel.title
        }
    }
    
    var delegate : MovieCellDelegate?
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func clickFav(_ sender: Any) {
        delegate?.onTapAdd(cell: self, upcomingLocal: upcomingModel)
    }
}
