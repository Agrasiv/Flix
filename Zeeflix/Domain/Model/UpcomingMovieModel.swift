//
//  UpcomingMovieModel.swift
//  Zeeflix
//
//  Created by Pyae Phyo Oo on 13/10/2024.
//

import Foundation
import ObjectMapper

class UpcomingMovieResponse : BaseResponse {
    var data : [UpcomingMovieResponseData]?
    override func mapping(map: Map) {
        super.mapping(map: map)
        data    <- map["results"]
    }
}

class UpcomingMovieResponseData : Mappable {
    
    var adult : Bool?
    var backdrop_path : String?
    var genre_ids : [Int] = [0]
    var id : Int = 0
    var original_language : String?
    var original_title : String?
    var overview : String?
    var popularity : Float = 0.0
    var poster_path : String?
    var release_date : String?
    var title : String?
    var video : Bool?
    var vote_average : Float = 0.0
    var vote_count = 0
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        adult                <- map["adult"]
        backdrop_path        <- map["backdrop_path"]
        genre_ids            <- map["genre_ids"]
        id                   <- map["id"]
        original_language    <- map["original_language"]
        original_title       <- map["original_title"]
        overview             <- map["overview"]
        popularity           <- map["popularity"]
        poster_path          <- map["poster_path"]
        release_date         <- map["release_date"]
        title                <- map["title"]
        video                <- map["video"]
        vote_average         <- map["vote_average"]
        vote_count           <- map["vote_count"]
    }
}
