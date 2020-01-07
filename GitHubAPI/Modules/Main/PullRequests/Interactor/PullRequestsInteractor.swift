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
    
    // MARK: - Properties

    weak var output: PullRequestsInteractorOutput?
    let network: Networking
    private let disposeBag = DisposeBag()
    
    // MARK: - Initialization
    
    init(network: Networking) {
        self.network = network
    }
    
    // MARK: - Use case
    
    func fetchPullRequests(withUrl url: URL) {
        network
            .request(url: url.absoluteString, method: .get,
                     parameters: nil, returnType: [PullRequest].self)
            .subscribe(onSuccess: { [weak self] pullRequests in
                self?.output?.pullRequestsFetched(pullRequests)
            }) { [weak self] _ in
                self?.output?.pullRequestsFetchFailed()
        }.disposed(by: disposeBag)
    }
}
