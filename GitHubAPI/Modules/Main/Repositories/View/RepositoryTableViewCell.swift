//
//  RepositoryTableViewCell.swift
//  GitHubAPI
//
//  Created by Danilo Camarotto on 05/10/18.
//  Copyright © 2018 DanCamarotto. All rights reserved.
//

import UIKit
import Kingfisher

class RepositoryTableViewCell: UITableViewCell {
    
    // MARK: - Outlets and variables
    
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var repositoryNameLabel: UILabel!
    @IBOutlet weak var starsLabel: UILabel!
    @IBOutlet weak var forksLabel: UILabel!
    @IBOutlet weak var moreInfo: UITextView!
    
    func setup(with repository: RepositoryCell) {
        avatarImage.kf.setImage(with: URL(string: repository.avatarUrl))
        repositoryNameLabel.text = repository.name
        starsLabel.text = repository.stars
        forksLabel.text = repository.forks
        moreInfo.text = repository.moreInfo
    }
    
}
