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
    private var disposeBag = DisposeBag()
    
    func fetchRepositories() {
        MainApiService
            .fetchRepositories()
            .subscribe(onNext: { (repository) in
                self.output.repositoriesFetched(repository)
            }, onError: { (error) in
                self.output.repositoriesFetchFailed()
            }).disposed(by: disposeBag)
    }
    
}
