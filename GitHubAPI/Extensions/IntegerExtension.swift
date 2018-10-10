//
//  IntegerExtension.swift
//  GitHubAPI
//
//  Created by Danilo Camarotto on 05/10/18.
//  Copyright © 2018 DanCamarotto. All rights reserved.
//

import Foundation

extension Int {
    
    func formatted(withSeparator separator: String) -> String? {
        return Formatter.withSeparator(separator).string(for: self)
    }
    
}
