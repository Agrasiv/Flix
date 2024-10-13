//
//  APIservice.swift
//  Zeeflix
//
//  Created by Pyae Phyo Oo on 13/10/2024.
//

import Foundation
import Alamofire

class ApiService {
    
    static func getHeaders() -> HTTPHeaders {
        var headers: HTTPHeaders = [:]
        headers["Accept"] = "application/json"
        return headers
    }
}
