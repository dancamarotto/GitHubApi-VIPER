//
//  Repository.swift
//  GitHubAPI
//
//  Created by Danilo Camarotto on 04/10/18.
//  Copyright © 2018 DanCamarotto. All rights reserved.
//

import Foundation

struct Repository: Decodable {
    var items: [RepositoryItem]
}

struct RepositoryItem: Decodable {
    let id: Int
    let name: String
    let description: String
    let stargazersCount: Int
    let forksCount: Int
    let pullsUrl: String
    let owner: RepositoryOwner
}

struct RepositoryOwner: Decodable {
    let login: String
    let avatarUrl: String
}
