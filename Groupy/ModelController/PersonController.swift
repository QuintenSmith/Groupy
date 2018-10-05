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
    
    // source of truth
    var persons: [Person] = []
    
    
    // CRUD
    
    // Create
    func createPerson(name: String) {
        let newPerson = Person(name: name)
        persons.append(newPerson)
        save()
    }
   
    
    // Delete
    
    func deletePerson(person: Person) {
        guard let index = PersonController.shared.persons.firstIndex(of: person) else {return}
        persons.remove(at: index)
        save()
    }
    
    func fileURL() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileName = "person.json"
        let documentsDirectoryURL = urls[0].appendingPathComponent(fileName)
        return documentsDirectoryURL
    }
    
    func save() {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(persons)
            try data.write(to: fileURL())
        } catch {
            print("Error saving to persistence: \(error.localizedDescription)")
        }
    }
    
    func load() -> [Person] {
        let decoder = JSONDecoder()
        
        do {
            let data = try Data(contentsOf: fileURL())
            let decodedPersons = try decoder.decode([Person].self, from: data)
            return decodedPersons
        } catch {
            print("Error loadking from persistence \(error.localizedDescription)")
        }
        return []
    }
    
}

