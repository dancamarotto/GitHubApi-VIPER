//
//  PullRequestDetailsRouter.swift
//  GitHubAPI
//
//  Created by Danilo Camarotto on 10/10/2018.
//  Copyright © 2018 DanCamarotto. All rights reserved.
//

import UIKit

class PullRequestDetailsRouter: PullRequestDetailsWireframe {

    weak var viewController: UIViewController?

    static func assembleModule(_ url: URL) -> UIViewController {
        let view = instantiateView(named: PullRequestDetailsViewController.viewID, from: mainStoryboard) as! PullRequestDetailsViewController
        let presenter = PullRequestDetailsPresenter()
        let interactor = PullRequestDetailsInteractor()
        let router = PullRequestDetailsRouter()

        view.presenter = presenter

        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        presenter.url = url

        interactor.output = presenter

        router.viewController = view

        return view
    }

}
