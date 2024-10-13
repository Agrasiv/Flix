//
//  UpcomingMovieVM.swift
//  Zeeflix
//
//  Created by Pyae Phyo Oo on 13/10/2024.
//

import Foundation
import UIKit

protocol UpcomingMovieVMProtocol {
    func loadUpcomingMovie()
}

class UpcomingMovieVM : BaseVM, UpcomingMovieVMProtocol {
    
    var upcomingMovieList : (([UpcomingMovieLocalObject]) -> Void)?
    
    private var movies: [UpcomingMovieResponseData] = []
    
    private var movieLocal: [UpcomingMovieLocalObject] = []
    
    let upcomingLocalObject = UpcomingMovieLocalObject.sharedInstance
    
    func loadUpcomingMovie() {
        self.loading?(true)
        UpcomingMovieDAO.shared.getUpcomingMovie { [weak self] (response, error) in
            guard let self = self else {return}
            self.loading?(false)
            if let data = response?.data {
                self.movies = data
                for indx in 0..<(self.movies.count) {
                    let dic = self.movies[indx]
                    self.upcomingLocalObject.id = dic.id
                    self.upcomingLocalObject.title = dic.original_title ?? ""
                    self.upcomingLocalObject.image = dic.backdrop_path ?? ""
                    self.upcomingLocalObject.overview = dic.overview ?? ""
                    self.upcomingLocalObject.date = dic.release_date ?? ""
                    self.upcomingLocalObject.insertMovie()
                }
                self.movieLocal = self.upcomingLocalObject.fetchAllUpcomingMovies()
                self.upcomingMovieList!(movieLocal)
            } else {
                self.error?(error!.localizedDescription)
                return
            }
        }
    }
}

    
