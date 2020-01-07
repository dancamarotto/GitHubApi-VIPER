//
//  RepositoriesContract.swift
//  GitHubAPI
//
//  Created by Danilo Camarotto on 04/10/18.
//  Copyright © 2018 DanCamarotto. All rights reserved.
//

import UIKit

protocol RepositoriesView: IndicatableView {
    var presenter: RepositoriesPresentation! { get set }
    
    func showRepositories(_ repositories: [RepositoryCell])
}

protocol RepositoriesPresentation: class {
    var view: RepositoriesView? { get set }
    var interactor: RepositoriesUseCase! { get set }
    var router: RepositoriesWireframe! { get set }
    
    func viewDidLoad()
    func didSelectRepository(atIndex index: Int)
}

protocol RepositoriesUseCase: class {
    var output: RepositoriesInteractorOutput! { get set }
    var network: Networking { get }
    
    func fetchRepositories()
}

protocol RepositoriesInteractorOutput: class {
    func repositoriesFetched(_ repositories: Repository)
    func repositoriesFetchFailed()
}

protocol RepositoriesWireframe: class {
    var viewController: UIViewController? { get set }
    
    static func assembleModule() -> UIViewController
    
    func presentPullRequests(for repository: RepositoryItem)
}
