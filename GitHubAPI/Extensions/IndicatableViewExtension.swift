//
//  IndicatableViewExtension.swift
//  GitHubAPI
//
//  Created by Danilo Camarotto on 04/10/18.
//  Copyright © 2018 DanCamarotto. All rights reserved.
//

import Foundation
import PKHUD

extension IndicatableView where Self: UIViewController {
    
    func showActivityIndicator() {
        HUD.show(.progress)
    }
    
    func hideActivityIndicator() {
        HUD.hide()
    }
    
}
