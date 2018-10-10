//
//  Endpoints.swift
//  GitHubAPI
//
//  Created by Danilo Camarotto on 05/10/18.
//  Copyright © 2018 DanCamarotto. All rights reserved.
//

import Foundation

class Endpoints {
    
    private static let baseUrl = "https://api.github.com"
    static let urlForSwiftRepositories = "\(baseUrl)/search/repositories?q=language:Swift&Sort=stars"
    // /search/repositories?q=language:Swift&Sort=stars&page=
    
}
