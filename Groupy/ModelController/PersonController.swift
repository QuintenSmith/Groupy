//
//  PersonController.swift
//  Groupy
//
//  Created by Quinten Smith on 10/5/18.
//  Copyright © 2018 Quinten Smith. All rights reserved.
//

import Foundation

class PersonController {
    
    // shared instance
    static let shared = PersonController()
    
    private init() {}
    
    // source of truth
    var persons: [Person] = []
    
    // CRUD
    
    // Create
    func createPerson(name: String) {
        let newPerson = Person(name: name)
        persons.append(newPerson)
    }
    
    // Delete
    
    func deletePerson(person: Person) {
        guard let index = PersonController.shared.persons.firstIndex(of: person) else {return}
        persons.remove(at: index)
    }
}
