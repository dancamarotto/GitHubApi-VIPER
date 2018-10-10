//
//  FormatterExtension.swift
//  GitHubAPI
//
//  Created by Danilo Camarotto on 05/10/18.
//  Copyright © 2018 DanCamarotto. All rights reserved.
//

import Foundation

extension Formatter {
    
    static func withSeparator(_ separator: String) -> NumberFormatter {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = separator
        formatter.numberStyle = .decimal
        return formatter
    }
    
}
