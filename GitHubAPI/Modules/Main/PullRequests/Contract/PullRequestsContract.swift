//
//  PullRequestsContract.swift
//  GitHubAPI
//
//  Created by Danilo Camarotto on 06/10/2018.
//  Copyright © 2018 DanCamarotto. All rights reserved.
//

import UIKit

protocol PullRequestsView: IndicatableView {
    var presenter: PullRequestsPresentation! { get set }
    
    func showPullRequests(_ pullRequests: [PullRequestCell])
}

protocol PullRequestsPresentation: class {
    var view: PullRequestsView? { get set }
    var interactor: PullRequestsUseCase! { get set }
    var router: PullRequestsWireframe! { get set }
    
    func viewDidLoad()
    func didSelectPullRequest(_ index: Int)
}

protocol PullRequestsUseCase: class {
    var output: PullRequestsInteractorOutput? { get set }
    
    func fetchPullRequests(withUrl url: URL)
}

protocol PullRequestsInteractorOutput: class {
    func pullRequestsFetched(_ pullRequests: [PullRequest])
    func pullRequestsFetchFailed()
}

protocol PullRequestsWireframe: class {
    var viewController: UIViewController? { get set }

    static func assembleModule(_ repository: RepositoryItem) -> UIViewController
    
    func presentPullRequestDetails(_ url: URL)
}
