//
//  AlamofireService.swift
//  Zeeflix
//
//  Created by Pyae Phyo Oo on 13/10/2024.
//

import Alamofire
import ObjectMapper
import AlamofireObjectMapper

typealias ApiResult<T: Mappable> = (_ response: T?, _ error: Error?) -> ()

class AlamofireService {
    
    static let shared = AlamofireService()
    
    private init() {}
    
    func request<T: BaseResponse>(_ type: T.Type, at route: String, headers: HTTPHeaders, method: HTTPMethod, params: Parameters = [:], encoding: ParameterEncoding = JSONEncoding.default, completion: @escaping ApiResult<T>) {
        let url = route
        
        debugPrint("url: ", url)
        debugPrint("params: ", params)
        debugPrint("headers: ", headers)
        
        Alamofire.request(url, method: method, encoding: encoding, headers: headers).validate().responseObject { (response: DataResponse<T>) in
            switch  response.result {
            case .success(let response):
                if let result = Mapper<T>().map(JSONObject: response.toJSON()) {
                    if result.isSuccess() {
                        completion(result, nil)
                        print(result)
                    } else {
                        completion(nil, APIError(code: response.page, message: ""))
                    }
                } else {
                    completion(nil, APIError(code: -1 , message: ""))
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}

