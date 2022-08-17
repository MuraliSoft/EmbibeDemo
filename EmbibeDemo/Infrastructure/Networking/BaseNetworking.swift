//
//  BaseNetworking.swift
//  EmbibeDemo
//
//  Created by Admin on 8/16/22.
//

import Alamofire
import Combine
import Foundation

class BaseNetworking {
    public static let shared = BaseNetworking()
    
    func request<T: Codable>(_ t: T.Type, endPoint: API, completion: @escaping (_ result: T?, _ error: ErrorResponse?) -> Void) {
        let url = buildRequestURL(endPoint: endPoint)
        
        if url != nil {
            AF.request(url!,
                       method: endPoint.method,
                       parameters: endPoint.bodyParamaters,
                       encoding: endPoint.bodyEncoding).validate().responseDecodable(of: T.self) { response in
                switch response.result {
                    case .success:
                        guard let response = response.value else {
                            completion(nil, ErrorResponse(message: "Parsing error"))
                            return
                        }
                        completion(response, nil)
                       
                    case .failure:
                        completion(nil, ErrorResponse(message: "Server error"))
                }
            }
        } else {
            completion(nil, ErrorResponse(message: "URL error"))
        }
    }
    
    private func buildRequestURL(endPoint: API) -> URL? {
        let queryDictionary = endPoint.queryParameters
        
        let env = Environment.live
        var components = URLComponents()
        
        components.scheme = "https"
        components.host = env.baseURL
        components.path = endPoint.path
        
        components.queryItems = queryDictionary.map {
            URLQueryItem(name: $0, value: "\($1)")
        }
        return components.url
    }
}
