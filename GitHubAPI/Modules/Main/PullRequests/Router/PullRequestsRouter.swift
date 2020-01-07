//
//  PullRequestsRouter.swift
//  GitHubAPI
//
//  Created by Danilo Camarotto on 06/10/2018.
//  Copyright © 2018 DanCamarotto. All rights reserved.
//

import UIKit

class PullRequestsRouter: PullRequestsWireframe {

    weak var viewController: UIViewController?

    static func assembleModule(_ repository: RepositoryItem) -> UIViewController {
        let view = instantiateView(named: PullRequestsViewController.viewID, from: mainStoryboard) as! PullRequestsViewController
        let presenter = PullRequestsPresenter()
        let interactor = PullRequestsInteractor(network: Network())
        let router = PullRequestsRouter()

        view.presenter = presenter

        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        presenter.repository = repository

        interactor.output = presenter

        router.viewController = view

        return view
    }
    
    func presentPullRequestDetails(_ url: URL) {
        let vc = PullRequestDetailsRouter.assembleModule(url)
        let backButton = UIBarButtonItem()
        backButton.title = " "
        viewController?.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }

}
