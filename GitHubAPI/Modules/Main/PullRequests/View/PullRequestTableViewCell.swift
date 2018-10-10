//
//  PullRequestTableViewCell.swift
//  GitHubAPI
//
//  Created by Danilo Camarotto on 09/10/18.
//  Copyright © 2018 DanCamarotto. All rights reserved.
//

import UIKit

class PullRequestTableViewCell: UITableViewCell {
    
    // MARK: - Outlets and variables
    
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    func setup(with pullRequest: PullRequestCell) {
        avatarImage.kf.setImage(with: URL(string: pullRequest.avatarUrl))
        nameLabel.text = pullRequest.name
        dateLabel.text = convertDate(pullRequest.createdAt)
        titleLabel.text = pullRequest.title
        descriptionTextView.text = pullRequest.description
    }
    
    private func convertDate(_ date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        if let newDate = dateFormatter.date(from: date) {
            dateFormatter.dateFormat = "MM/dd/yyyy"
            return dateFormatter.string(from: newDate)
        }
        return "-"
    }
    
}
