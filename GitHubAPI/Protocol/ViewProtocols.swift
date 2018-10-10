//
//  ViewProtocols.swift
//  GitHubAPI
//
//  Created by Danilo Camarotto on 04/10/18.
//  Copyright © 2018 DanCamarotto. All rights reserved.
//

import Foundation

protocol IndicatableView: class {
    func showActivityIndicator()
    func hideActivityIndicator()
}
