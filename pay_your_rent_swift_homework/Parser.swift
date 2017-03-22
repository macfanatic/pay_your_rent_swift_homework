//
//  parser.swift
//  pay_your_rent_swift_homework
//
//  Created by Matthew Millsaps-Brewer on 3/21/17.
//  Copyright © 2017 Matthew Millsaps-Brewer. All rights reserved.
//

import Foundation

class Parser {
    static func read(path: String) -> Array<Lease> {
        let url = NSURL.fileURL(withPath: path).standardizedFileURL
        
        do {
            let contents = try String(contentsOf: url, encoding: String.Encoding.utf8)
            
            var leases = [Lease]()
            contents.enumerateLines(invoking: { line, _ in
                leases.append(Lease.parse(line))
            })
            
            return leases

        } catch {
            CommandLine.stderr("Unable to read contents of file: \(path)")
            exit(EXIT_FAILURE)
        }
    }
}
