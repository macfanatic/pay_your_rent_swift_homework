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
    
    static func parse(_ string: String) -> Lease {
        return Lease(unit: "3", name: "Matt", raw: string)
    }
}
