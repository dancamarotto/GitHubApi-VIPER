//
//  PullRequestDetailsPresenter.swift
//  GitHubAPI
//
//  Created by Danilo Camarotto on 10/10/2018.
//  Copyright © 2018 DanCamarotto. All rights reserved.
//

import Foundation

class PullRequestDetailsPresenter: PullRequestDetailsPresentation, PullRequestDetailsInteractorOutput {

    weak var view: PullRequestDetailsView?
    var interactor: PullRequestDetailsUseCase!
    var router: PullRequestDetailsWireframe!
    var url: URL!
    
    func viewDidLoad() {
        view?.presentUrl(url)
    }

}
