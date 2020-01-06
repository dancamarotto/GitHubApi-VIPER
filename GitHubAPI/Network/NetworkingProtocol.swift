//
//  NetworkingProtocol.swift
//  GitHubAPI
//
//  Created by Danilo Camarotto on 06/01/20.
//  Copyright © 2020 DanCamarotto. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

protocol Networking {
    var baseUrl: String { get }
    func request<T: Decodable>(url: String,
                               method: HTTPMethod,
                               parameters: [String : Any]?,
                               returnType: T.Type) -> Single<T>
}
