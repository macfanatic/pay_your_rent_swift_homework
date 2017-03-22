//
//  main.swift
//  pay_your_rent_swift_homework
//
//  Created by Matthew Millsaps-Brewer on 3/21/17.
//  Copyright © 2017 Matthew Millsaps-Brewer. All rights reserved.
//

import Foundation

guard CommandLine.arguments.count > 1 else {
    CommandLine.stderr("You must provide a path to a file")
    exit(EXIT_FAILURE)
}

let path = CommandLine.arguments[1]
let leases = Parser.read(path: path)

for lease in leases {
    print(lease.raw)
}
