//
//  RepositoriesPresenter.swift
//  GitHubAPI
//
//  Created by Danilo Camarotto on 04/10/18.
//  Copyright © 2018 DanCamarotto. All rights reserved.
//

import Foundation

class RepositoriesPresenter: RepositoriesPresentation, RepositoriesInteractorOutput {
    
    // MARK: - Variables
    
    weak var view: RepositoriesView?
    var interactor: RepositoriesUseCase!
    var router: RepositoriesWireframe!
    
    var repositories: Repository? {
        didSet {
            guard let repositories = self.repositories else { return }
            let repositoryCellList = repositories.items.map({ return RepositoryCell(with: $0) })
            view?.showRepositories(repositoryCellList)
        }
    }
    
    // MARK: - Repositories Presentation
    
    func viewDidLoad() {
        view?.showActivityIndicator()
        interactor.fetchRepositories()
    }
    
    func didSelectRepository(atIndex index: Int) {
        if let repository = repositories?.items[index] {
            router.presentPullRequests(for: repository)
        }
    }
    
    // MARK: - Repositories Interactor Output
    
    func repositoriesFetched(_ repositories: Repository) {
        view?.hideActivityIndicator()
        self.repositories = repositories
    }
    
    func repositoriesFetchFailed() {
        view?.hideActivityIndicator()
    }
    
}
