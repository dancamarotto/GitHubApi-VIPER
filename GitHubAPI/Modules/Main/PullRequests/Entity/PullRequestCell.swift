//
//  PullRequestCell.swift
//  GitHubAPI
//
//  Created by Danilo Camarotto on 09/10/18.
//  Copyright © 2018 DanCamarotto. All rights reserved.
//

import Foundation

struct PullRequestCell {
    
    let avatarUrl: String
    let name: String
    let createdAt: String
    let title: String
    let description: String
    let htmlUrl: String
    
    init(with pullRequest: PullRequest) {
        avatarUrl = pullRequest.user.avatarUrl
        name = pullRequest.user.login
        createdAt = pullRequest.createdAt
        title = pullRequest.title
        description = pullRequest.body
        htmlUrl = pullRequest.htmlUrl
    }
    
}
