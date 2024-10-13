//
//  PopularMovieVM.swift
//  Zeeflix
//
//  Created by Pyae Phyo Oo 13/10/2024.
//

import Foundation

protocol PopularMovieVMProtocol {
    func loadPopularMovie()
}

class PopularMovieVM : BaseVM, PopularMovieVMProtocol {
    
    var popularMovieList : (([PopularMovieLocalObject]) -> Void)?
    
    private var movies: [PopularMovieModelResponseData] = []
    
    private var movieLocal: [PopularMovieLocalObject] = []
    
    let popularLocalObject = PopularMovieLocalObject.sharedInstance
    
    func loadPopularMovie() {
        self.loading?(true)
        PopularMovieDAO.shared.getPopularMovie { [weak self] (response, error) in
            guard let self = self else {return}
            self.loading?(false)
            if let data = response?.data {
                self.movies = data
                for indx in 0..<(self.movies.count) {
                    let dic = self.movies[indx]
                    self.popularLocalObject.id = dic.id
                    self.popularLocalObject.title = dic.original_title ?? ""
                    self.popularLocalObject.image = dic.backdrop_path ?? ""
                    self.popularLocalObject.insertPopularMovie()
                }
                self.movieLocal = self.popularLocalObject.fetchAllPopularMovies()
                self.popularMovieList!(movieLocal)
            } else {
                self.error?(error!.localizedDescription)
                return
            }
        }
    }
}
