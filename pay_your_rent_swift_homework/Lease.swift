//
//  Lease.swift
//  pay_your_rent_swift_homework
//
//  Created by Matthew Millsaps-Brewer on 3/21/17.
//  Copyright © 2017 Matthew Millsaps-Brewer. All rights reserved.
//

import Foundation

enum LeasingError : Error {
    case invalidFormat
}

class Lease : Comparable {
    var unit: String
    var name: String
    var raw: String
    
    fileprivate var numericUnit: Int?
    fileprivate var alphaUnit: String?
    
    init(unit: String, name: String, raw: String) throws {
        self.unit = unit
        self.name = name
        self.raw = raw
        
        try parseUnit()
    }
    
    static func ==(left:Lease, right:Lease) -> Bool {
        return (left.numericUnit!, left.alphaUnit!) == (right.numericUnit!, right.alphaUnit!)
    }
    
    static func <(left:Lease, right:Lease) -> Bool {
        if left.numericUnit != right.numericUnit {
            return left.numericUnit! < right.numericUnit!
        }
        return left.alphaUnit! < right.alphaUnit!
    }
    
    static func parse(_ string: String) -> Lease? {
        do {
            let regex = try NSRegularExpression(pattern: "#([a-zA-Z0-9]+) [-–] (.+)", options: .caseInsensitive)
            if let match = regex.firstMatch(in: string, options: .anchored, range: NSRange(location: 0, length: string.utf16.count)) {
                let unit = (string as NSString).substring(with: match.rangeAt(1))
                let name = (string as NSString).substring(with: match.rangeAt(2))
                
                return try Lease(unit: unit, name: name, raw: string)
            }
            
            return nil
        } catch {
            return nil
        }
    }
    
    private func parseUnit() throws {
        var regex = try! NSRegularExpression(pattern: "([a-zA-Z]+)(\\d*)", options: .caseInsensitive)
        if let match = regex.firstMatch(in: self.unit, options: .anchored, range: NSRange(location: 0, length: self.unit.utf16.count)) {
            self.alphaUnit = (self.unit as NSString).substring(with: match.rangeAt(1))
            self.numericUnit = Int((self.unit as NSString).substring(with: match.rangeAt(2)))!
        } else {
            regex = try! NSRegularExpression(pattern: "(\\d+)([a-zA-Z]*)", options: .caseInsensitive)
            if let match = regex.firstMatch(in: self.unit, options: .anchored, range: NSRange(location: 0, length: self.unit.utf16.count)) {
                self.numericUnit = Int((self.unit as NSString).substring(with: match.rangeAt(1)))!
                self.alphaUnit = (self.unit as NSString).substring(with: match.rangeAt(2))
            } else {
                throw LeasingError.invalidFormat
            }
        }
    }
}
