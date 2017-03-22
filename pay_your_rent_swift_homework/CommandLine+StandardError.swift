//
//  CommandLine+StandardError.swift
//  pay_your_rent_swift_homework
//
//  Created by Matthew Millsaps-Brewer on 3/21/17.
//  Copyright © 2017 Matthew Millsaps-Brewer. All rights reserved.
//

import Foundation

extension CommandLine {
    static func stderr(_ str: String) {
        let handle = FileHandle.standardError
        
        if let data = "\(str)\n".data(using: .utf8, allowLossyConversion: true) {
            handle.write(data)
        }
    }
}
