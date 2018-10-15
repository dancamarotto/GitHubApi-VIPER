//
//  MainApiService.swift
//  GitHubAPI
//
//  Created by Danilo Camarotto on 05/10/18.
//  Copyright © 2018 DanCamarotto. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

class MainApiService {
    
    static let shared = MainApiService()
    
    func fetchRepositories() -> Observable<Repository> {
        return Observable<Repository>.create({ (observer) -> Disposable in
            let request = Alamofire
                .request(Endpoints.urlForSwiftRepositories, method: .get)
                .validate()
                .response(completionHandler: { (response) in
                    if let error = response.error {
                        observer.onError(error)
                    }
                    
                    do {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let repository = try decoder.decode(Repository.self, from: response.data ?? Data())
                        observer.onNext(repository)
                        observer.onCompleted()
                    } catch {
                        observer.onError(error)
                    }
                    
                })
            
            return Disposables.create(with: {
                request.cancel()
            })
        })
    }
    
    func fetchPullRequests(withUrl url: URL) -> Observable<[PullRequest]> {
        return Observable<[PullRequest]>.create({ (observer) -> Disposable in
            let request = Alamofire
                .request(url, method: .get)
                .validate()
                .response(completionHandler: { (response) in
                    if let error  = response.error {
                        observer.onError(error)
                    }
                    
                    do {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let pullRequests = try decoder.decode([PullRequest].self, from: response.data ?? Data())
                        observer.onNext(pullRequests)
                        observer.onCompleted()
                    } catch {
                        observer.onError(error)
                    }
                })
            
            return Disposables.create(with: {
                request.cancel()
            })
        })
    }
    
}
