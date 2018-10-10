//
//  PullRequest.swift
//  GitHubAPI
//
//  Created by Danilo Camarotto on 07/10/18.
//  Copyright © 2018 DanCamarotto. All rights reserved.
//

import Foundation

struct PullRequest: Decodable {
    var user: GitHubUser
    var id: Int
    var htmlUrl: String
    var state: String
    var title: String
    var body: String
    var createdAt: String
}

struct GitHubUser: Decodable {
    var login: String
    var avatarUrl: String
}
