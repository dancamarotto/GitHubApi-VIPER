//
//  RootRouter.swift
//  GitHubAPI
//
//  Created by Danilo Camarotto on 04/10/18.
//  Copyright © 2018 DanCamarotto. All rights reserved.
//

import UIKit

protocol RootWireframe: class {
    static func presentRootScreen(in window: UIWindow)
}

class RootRouter: RootWireframe {
    
    static func presentRootScreen(in window: UIWindow) {
        let view = RepositoriesRouter.assembleModule()
        let navigation = instantiateView(named: "MainNavigationControllerID", from: mainStoryboard) as! UINavigationController
        navigation.setViewControllers([view], animated: false)
        
        window.makeKeyAndVisible()
        window.rootViewController = navigation
    }
    
}
