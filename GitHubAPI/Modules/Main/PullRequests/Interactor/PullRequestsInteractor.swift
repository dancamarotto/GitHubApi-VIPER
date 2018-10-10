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
    let disposeBag = DisposeBag()
    
    func fetchPullRequests(withUrl url: URL) {
        MainApiService
            .fetchPullRequests(withUrl: url)
            .subscribe(onNext: { (pullRequests) in
                self.output?.pullRequestsFetched(pullRequests)
            }, onError: { (error) in
                self.output?.pullRequestsFetchFailed()
            }).disposed(by: disposeBag)
    }
}
