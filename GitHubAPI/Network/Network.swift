//
//  Network.swift
//  GitHubAPI
//
//  Created by Danilo Camarotto on 06/01/20.
//  Copyright © 2020 DanCamarotto. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

class Network: Networking {
    
    let baseUrl: String
    
    init() {
        baseUrl = "https://api.github.com"
    }
    
    func request<T: Decodable>(url: String,
                               method: HTTPMethod = .get,
                               parameters: [String : Any]? = nil,
                               returnType: T.Type) -> Single<T> {
        return Single.create { single in
            let request = Alamofire
                .request(url, method: method, parameters: parameters,
                         encoding: URLEncoding.queryString)
                .validate()
                .response(completionHandler: { response in
                    if let error = response.error {
                        return single(.error(error))
                    }
                    
                    do {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let object = try decoder
                            .decode(T.self, from: response.data ?? Data())
                        single(.success(object))
                    } catch {
                        single(.error(error))
                    }
                })
            
            return Disposables.create {
                request.cancel()
            }
        }
    }
}
