//
//  PullRequestsPresenter.swift
//  GitHubAPI
//
//  Created by Danilo Camarotto on 06/10/2018.
//  Copyright © 2018 DanCamarotto. All rights reserved.
//

import Foundation

class PullRequestsPresenter: PullRequestsPresentation, PullRequestsInteractorOutput {

    weak var view: PullRequestsView?
    var interactor: PullRequestsUseCase!
    var router: PullRequestsWireframe!
    var repository: RepositoryItem!
    var pullRequests: [PullRequest]?
    
     // MARK: - Pull Requests Presentation
    
    func viewDidLoad() {
        if let url = URL(string: repository.pullsUrl.replacingOccurrences(of: "{/number}", with: "")) {
            view?.showActivityIndicator()
            interactor.fetchPullRequests(withUrl: url)
        }
    }
    
    func didSelectPullRequest(_ index: Int) {
        guard let pullRequests = pullRequests else { return }
        if let url = URL(string: pullRequests[index].htmlUrl) {
            router.presentPullRequestDetails(url)
        }
    }
    
    // MARK: - Pull Requests Interactor Output
    
    func pullRequestsFetched(_ pullRequests: [PullRequest]) {
        view?.hideActivityIndicator()
        self.pullRequests = pullRequests
        let pullRequestCells = pullRequests.map({ return PullRequestCell(with: $0) })
        view?.showPullRequests(pullRequestCells)
    }
    
    func pullRequestsFetchFailed() {
        view?.hideActivityIndicator()
    }

}
