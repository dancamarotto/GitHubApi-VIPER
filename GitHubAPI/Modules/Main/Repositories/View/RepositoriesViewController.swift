//
//  RepositoriesViewController.swift
//  GitHubAPI
//
//  Created by Danilo Camarotto on 04/10/18.
//  Copyright © 2018 DanCamarotto. All rights reserved.
//

import UIKit

class RepositoriesViewController: UIViewController, RepositoriesView {
    
    // MARK: - Outlets and variables
    
    @IBOutlet weak var repositoriesTableView: UITableView! {
        didSet {
            let nib = UINib(nibName: "RepositoryTableViewCell", bundle: nil)
            repositoriesTableView.register(nib, forCellReuseIdentifier: repositoryTableViewCellID)
        }
    }
    
    static let viewID = "RepositoriesViewID"
    let repositoryTableViewCellID = "RepositoryTableViewCellID"
    var presenter: RepositoriesPresentation!
    var repositories = [RepositoryCell]() {
        didSet {
            repositoriesTableView.reloadData()
        }
    }
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
    }
    
    // MARK: - Repositories View
    
    func showRepositories(_ repositories: [RepositoryCell]) {
        self.repositories = repositories
    }
    
}

extension RepositoriesViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Table View Data Source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: repositoryTableViewCellID) as! RepositoryTableViewCell
        let repository = repositories[indexPath.row]
        
        cell.setup(with: repository)
        return cell
    }
    
    // MARK: - Table View Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.didSelectRepository(atIndex: indexPath.row)
    }
    
}
