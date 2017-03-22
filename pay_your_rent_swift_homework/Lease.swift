//
//  Lease.swift
//  pay_your_rent_swift_homework
//
//  Created by Matthew Millsaps-Brewer on 3/21/17.
//  Copyright © 2017 Matthew Millsaps-Brewer. All rights reserved.
//

import Foundation

class Lease {
    var unit: String
    var name: String
    var raw: String
    
    init(unit: String, name: String, raw: String) {
        self.unit = unit
        self.name = name
        self.raw = raw
    }
    
    static func parse(_ string: String) -> Lease? {
        do {
            let regex = try NSRegularExpression(pattern: "#([a-zA-Z0-9]+) [-–] (.+)", options: .caseInsensitive)
            if let match = regex.firstMatch(in: string, options: .anchored, range: NSRange(location: 0, length: string.utf16.count)) {
                let unit = (string as NSString).substring(with: match.rangeAt(1))
                let name = (string as NSString).substring(with: match.rangeAt(2))
                
                return Lease(unit: unit, name: name, raw: string)
            }
            
            return nil
        } catch {
            return nil
        }
    }
}
