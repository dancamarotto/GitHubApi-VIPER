//
//  RepositoryCell.swift
//  GitHubAPI
//
//  Created by Danilo Camarotto on 06/10/18.
//  Copyright © 2018 DanCamarotto. All rights reserved.
//

import Foundation

struct RepositoryCell {
    
    let avatarUrl: String
    let name: String
    let stars: String
    let forks: String
    let moreInfo: String
    
    init(with repository: RepositoryItem) {
        avatarUrl = repository.owner.avatarUrl
        name = repository.name
        stars = "Stars: \(repository.stargazersCount.formatted(withSeparator: ".") ?? "-")"
        forks = "Forks: \(repository.forksCount.formatted(withSeparator: ".") ?? "-")"
        moreInfo = String("Author: \(repository.owner.login)\nDescription: \(repository.description)")
    }
    
}
