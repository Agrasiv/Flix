//
//  MovieDetail.swift
//  Zeeflix
//
//  Created by Pyae Phyo Oo on 13/10/2024.
//

import Foundation
import UIKit

class MovieDetail : BaseViewController {
    
    @IBOutlet weak var imgMovie: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbOverView: UILabel!
    @IBOutlet weak var lbDate: UILabel!
    @IBOutlet weak var favBtn: UIButton!
    
    var id: Int?
    var favMark: Bool?
    var ImageString : String?
    var Name : String?
    var Overview : String?
    var Date : String?
    var fav: Bool?
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputData()
        favBtn.setImage(UIImage(named: fav ?? false ? "heartfill" : "heart"), for: .normal)
    }
    
    func inputData() {
        let image = "https://image.tmdb.org/t/p/w500" + "\(ImageString ?? "")"
        self.lbName.text = Name
        self.imgMovie.setImage(with: image)
        self.lbOverView.text = Overview
        self.lbDate.text = Date
    }
    
    @IBAction func tappedFAv(_ sender: Any) {
        if fav == false {
            favMark = true
        } else {
            favMark = false
        }
        _ = UpcomingMovieLocalObject.sharedInstance.updateFavMovie(isFavourtie: favMark!, movieId: id!)
        favBtn.setImage(UIImage(named: favMark! ? "heartfill" : "heart"), for: .normal)
    }
}
