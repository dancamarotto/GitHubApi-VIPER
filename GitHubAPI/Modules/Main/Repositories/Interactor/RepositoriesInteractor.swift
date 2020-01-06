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
    
    weak var output: RepositoriesInteractorOutput!
    private let disposeBag = DisposeBag()
    private let apiService = Network()
    
    func fetchRepositories() {
        let url = "\(apiService.baseUrl)/search/repositories?q=language:Swift&Sort=stars"
        
        apiService
            .request(url: url, returnType: Repository.self)
            .subscribe(onSuccess: { [weak self] repository in
                self?.output.repositoriesFetched(repository)
            }) { [weak self] _ in
                self?.output.repositoriesFetchFailed()
        }.disposed(by: disposeBag)
    }
}
