//
//  RepositoriesRouter.swift
//  GitHubAPI
//
//  Created by Danilo Camarotto on 04/10/18.
//  Copyright © 2018 DanCamarotto. All rights reserved.
//

import UIKit

class RepositoriesRouter: RepositoriesWireframe {
    
    weak var viewController: UIViewController?
    
    static func assembleModule() -> UIViewController {
        let view = instantiateView(named: RepositoriesViewController.viewID, from: mainStoryboard) as! RepositoriesViewController
        let presenter = RepositoriesPresenter()
        let interactor = RepositoriesInteractor(network: Network())
        let router = RepositoriesRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        
        router.viewController = view
        
        return view
    }
    
    func presentPullRequests(for repository: RepositoryItem) {
        let pullRequestView = PullRequestsRouter.assembleModule(repository) as! PullRequestsViewController
        viewController?.navigationController?.pushViewController(pullRequestView, animated: true)
    }
    
}
