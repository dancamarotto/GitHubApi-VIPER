//
//  MainTests.swift
//  GitHubAPITests
//
//  Created by Danilo Camarotto on 14/10/18.
//  Copyright © 2018 DanCamarotto. All rights reserved.
//

import XCTest
import Cuckoo
import RxSwift
@testable import GitHubAPI

class MainTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testRepositoriesPresenter() {
        let presenter = RepositoriesPresenter()
        let interactor = RepositoriesInteractor()
        let router = RepositoriesRouter()
        interactor.apiService = MockMainApiService()
        weak var api = interactor.apiService as? MockMainApiService
        
        stub(api!) { (apiService) in
            when(apiService.fetchRepositories()).thenReturn(fetchMockedRepository())
        }
        
        interactor.output = presenter
        presenter.interactor = interactor
        presenter.router = router
        
        XCTAssertNil(presenter.repositories)
        
        presenter.viewDidLoad()
        
        guard let repositories = presenter.repositories else {
            XCTAssertNotNil(presenter.repositories)
            return
        }
        
        XCTAssertEqual(repositories.items.count, 4)
        
        if let firstRepository = repositories.items.first {
            XCTAssertEqual(firstRepository.name, "Alamofire")
            XCTAssertEqual(firstRepository.forksCount, 5184)
            XCTAssertEqual(firstRepository.owner.login, "Alamofire")
        }
        
        if let lastRepository = repositories.items.last {
            XCTAssertEqual(lastRepository.name, "ReactiveCocoa")
            XCTAssertEqual(lastRepository.forksCount, 3487)
            XCTAssertEqual(lastRepository.owner.login, "ReactiveCocoa")
        }
    }
    
    private func fetchMockedRepository() -> Observable<Repository> {
        return Observable<Repository>.create({ (observer) -> Disposable in
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let json = try self.getDataFromFile("repositories", ofType: "json")
                let repository = try decoder.decode(Repository.self, from: json)
                observer.onNext(repository)
                observer.onCompleted()
            } catch {
                observer.onError(error)
            }
            return Disposables.create()
        })
    }
    
    private func getDataFromFile(_ file: String, ofType fileType: String) throws -> Data {
        let bundle = Bundle(for: type(of: self))
        let path = bundle.path(forResource: file, ofType: fileType)
        return try NSData(contentsOfFile: path ?? "") as Data
    }
    
}
