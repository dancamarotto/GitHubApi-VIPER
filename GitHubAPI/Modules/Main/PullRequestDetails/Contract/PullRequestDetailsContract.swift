//
//  PullRequestDetailsContract.swift
//  GitHubAPI
//
//  Created by Danilo Camarotto on 10/10/2018.
//  Copyright © 2018 DanCamarotto. All rights reserved.
//

import UIKit

protocol PullRequestDetailsView: class{
    var presenter: PullRequestDetailsPresentation! { get set }
    
    func presentUrl(_ url: URL)
}

protocol PullRequestDetailsPresentation: class {
    var view: PullRequestDetailsView? { get set }
    var interactor: PullRequestDetailsUseCase! { get set }
    var router: PullRequestDetailsWireframe! { get set }
    
    func viewDidLoad()
}

protocol PullRequestDetailsUseCase: class {
    var output: PullRequestDetailsInteractorOutput? { get set }
}

protocol PullRequestDetailsInteractorOutput: class {
}

protocol PullRequestDetailsWireframe: class {
    var viewController: UIViewController? { get set }

    static func assembleModule(_ url: URL) -> UIViewController
}
