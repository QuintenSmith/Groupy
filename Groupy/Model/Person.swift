//
//  Person.swift
//  Groupy
//
//  Created by Quinten Smith on 10/5/18.
//  Copyright © 2018 Quinten Smith. All rights reserved.
//

import Foundation

class Person: Equatable, Codable {
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.name == rhs.name
    }
    
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
}
