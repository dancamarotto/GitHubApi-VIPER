//
//  PullRequestsInteractor.swift
//  GitHubAPI
//
//  Created by Danilo Camarotto on 06/10/2018.
//  Copyright © 2018 DanCamarotto. All rights reserved.
//

import UIKit
import RxSwift

class PullRequestsInteractor: PullRequestsUseCase {

    weak var output: PullRequestsInteractorOutput?
    private let disposeBag = DisposeBag()
    private let apiService = Network()
    
    func fetchPullRequests(withUrl url: URL) {
        apiService
            .request(url: url.absoluteString, returnType: [PullRequest].self)
            .subscribe(onSuccess: { [weak self] pullRequests in
                self?.output?.pullRequestsFetched(pullRequests)
            }) { [weak self] _ in
                self?.output?.pullRequestsFetchFailed()
        }.disposed(by: disposeBag)
    }
}
