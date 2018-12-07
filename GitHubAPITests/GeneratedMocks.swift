// MARK: - Mocks generated from file: GitHubAPI/Modules/Main/Network/MainApiService.swift at 2018-12-07 16:24:08 +0000

//
//  MainApiService.swift
//  GitHubAPI
//
//  Created by Danilo Camarotto on 05/10/18.
//  Copyright © 2018 DanCamarotto. All rights reserved.
//

import Cuckoo
@testable import GitHubAPI

import Alamofire
import Foundation
import RxSwift

class MockMainApiService: MainApiService, Cuckoo.ClassMock {
    typealias MocksType = MainApiService
    typealias Stubbing = __StubbingProxy_MainApiService
    typealias Verification = __VerificationProxy_MainApiService
    let cuckoo_manager = Cuckoo.MockManager(hasParent: true)

    

    

    
    // ["name": "fetchRepositories", "returnSignature": " -> Observable<Repository>", "fullyQualifiedName": "fetchRepositories() -> Observable<Repository>", "parameterSignature": "", "parameterSignatureWithoutNames": "", "inputTypes": "", "isThrowing": false, "isInit": false, "isOverriding": true, "hasClosureParams": false, "@type": "ClassMethod", "accessibility": "", "parameterNames": "", "call": "", "parameters": [], "returnType": "Observable<Repository>", "isOptional": false, "stubFunction": "Cuckoo.ClassStubFunction"]
     override func fetchRepositories()  -> Observable<Repository> {
        
            return cuckoo_manager.call("fetchRepositories() -> Observable<Repository>",
                parameters: (),
                superclassCall:
                    
                    super.fetchRepositories()
                    )
        
    }
    
    // ["name": "fetchPullRequests", "returnSignature": " -> Observable<[PullRequest]>", "fullyQualifiedName": "fetchPullRequests(withUrl: URL) -> Observable<[PullRequest]>", "parameterSignature": "withUrl url: URL", "parameterSignatureWithoutNames": "url: URL", "inputTypes": "URL", "isThrowing": false, "isInit": false, "isOverriding": true, "hasClosureParams": false, "@type": "ClassMethod", "accessibility": "", "parameterNames": "url", "call": "withUrl: url", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("withUrl"), name: "url", type: "URL", range: CountableRange(1406..<1422), nameRange: CountableRange(1406..<1413))], "returnType": "Observable<[PullRequest]>", "isOptional": false, "stubFunction": "Cuckoo.ClassStubFunction"]
     override func fetchPullRequests(withUrl url: URL)  -> Observable<[PullRequest]> {
        
            return cuckoo_manager.call("fetchPullRequests(withUrl: URL) -> Observable<[PullRequest]>",
                parameters: (url),
                superclassCall:
                    
                    super.fetchPullRequests(withUrl: url)
                    )
        
    }
    

	struct __StubbingProxy_MainApiService: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func fetchRepositories() -> Cuckoo.ClassStubFunction<(), Observable<Repository>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockMainApiService.self, method: "fetchRepositories() -> Observable<Repository>", parameterMatchers: matchers))
	    }
	    
	    func fetchPullRequests<M1: Cuckoo.Matchable>(withUrl url: M1) -> Cuckoo.ClassStubFunction<(URL), Observable<[PullRequest]>> where M1.MatchedType == URL {
	        let matchers: [Cuckoo.ParameterMatcher<(URL)>] = [wrap(matchable: url) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockMainApiService.self, method: "fetchPullRequests(withUrl: URL) -> Observable<[PullRequest]>", parameterMatchers: matchers))
	    }
	    
	}

	struct __VerificationProxy_MainApiService: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func fetchRepositories() -> Cuckoo.__DoNotUse<Observable<Repository>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("fetchRepositories() -> Observable<Repository>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func fetchPullRequests<M1: Cuckoo.Matchable>(withUrl url: M1) -> Cuckoo.__DoNotUse<Observable<[PullRequest]>> where M1.MatchedType == URL {
	        let matchers: [Cuckoo.ParameterMatcher<(URL)>] = [wrap(matchable: url) { $0 }]
	        return cuckoo_manager.verify("fetchPullRequests(withUrl: URL) -> Observable<[PullRequest]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}

}

 class MainApiServiceStub: MainApiService {
    

    

    
     override func fetchRepositories()  -> Observable<Repository> {
        return DefaultValueRegistry.defaultValue(for: Observable<Repository>.self)
    }
    
     override func fetchPullRequests(withUrl url: URL)  -> Observable<[PullRequest]> {
        return DefaultValueRegistry.defaultValue(for: Observable<[PullRequest]>.self)
    }
    
}

