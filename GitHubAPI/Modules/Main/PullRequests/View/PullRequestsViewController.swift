//
//  PullRequestsViewController.swift
//  GitHubAPI
//
//  Created by Danilo Camarotto on 06/10/2018.
//  Copyright © 2018 DanCamarotto. All rights reserved.
//

import UIKit

class PullRequestsViewController: UIViewController, PullRequestsView {
    
    // MARK: - Outlets and variables
    
    @IBOutlet weak var pullRequestsTableView: UITableView! {
        didSet {
            let nib = UINib(nibName: "PullRequestTableViewCell", bundle: nil)
            pullRequestsTableView.register(nib, forCellReuseIdentifier: pullRequestTableViewCellID)
        }
    }
    
    static let viewID = "PullRequestsViewID"
    let pullRequestTableViewCellID = "PullRequestTableViewCellID"
    var presenter: PullRequestsPresentation!
    var pullRequests = [PullRequestCell]() {
        didSet {
            pullRequestsTableView.reloadData()
        }
    }
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
    }
    
    // MARK: - Pull Requests View
    
    func showPullRequests(_ pullRequests: [PullRequestCell]) {
        self.pullRequests = pullRequests
    }
    
}

extension PullRequestsViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Table View Data Source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pullRequests.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: pullRequestTableViewCellID) as! PullRequestTableViewCell
        let pullRequest = pullRequests[indexPath.row]
        
        cell.setup(with: pullRequest)
        return cell
    }
    
    // MARK: - Table View Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.didSelectPullRequest(indexPath.row)
    }
    
}
