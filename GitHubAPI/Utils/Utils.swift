//
//  Utils.swift
//  GitHubAPI
//
//  Created by Danilo Camarotto on 06/10/18.
//  Copyright © 2018 DanCamarotto. All rights reserved.
//

import UIKit

func instantiateView(named view: String, from storyboard: String) -> UIViewController {
    return UIStoryboard(name: storyboard, bundle: nil).instantiateViewController(withIdentifier: view)
}
