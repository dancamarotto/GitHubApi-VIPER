//
//  RepositoriesInteractor.swift
//  GitHubAPI
//
//  Created by Danilo Camarotto on 04/10/18.
//  Copyright © 2018 DanCamarotto. All rights reserved.
//

import Foundation
import RxSwift

class RepositoriesInteractor: RepositoriesUseCase {
    
    // MARK: - Properties
    
    weak var output: RepositoriesInteractorOutput!
    let network: Networking
    private let disposeBag = DisposeBag()
    
    // MARK: - Initialization
    
    init(network: Networking) {
        self.network = network
    }
    
    // MARK: - Use case
    
    func fetchRepositories() {
        let url = "\(network.baseUrl)/search/repositories?q=language:Swift&Sort=stars"
        
        network
            .request(url: url, method: .get, parameters: nil,
                     returnType: Repository.self)
            .subscribe(onSuccess: { [weak self] repository in
                self?.output.repositoriesFetched(repository)
            }) { [weak self] _ in
                self?.output.repositoriesFetchFailed()
        }.disposed(by: disposeBag)
    }
}
