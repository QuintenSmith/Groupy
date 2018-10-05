//
//  GroupTableViewController.swift
//  Groupy
//
//  Created by Quinten Smith on 10/5/18.
//  Copyright © 2018 Quinten Smith. All rights reserved.
//

import UIKit

class GroupTableViewController: UITableViewController {
    
    
    @IBOutlet weak var randomizeBtn: UIBarButtonItem!
    @IBOutlet weak var addBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        PersonController.shared.persons = PersonController.shared.load()
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PersonController.shared.persons.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath)
        let person = PersonController.shared.persons[indexPath.row]
        cell.textLabel?.text = person.name
        return cell
    }
   
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let index = PersonController.shared.persons[indexPath.row]
            PersonController.shared.deletePerson(person: index)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func presentPerson(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.placeholder = "Add Person"
        }
        let action = UIAlertAction(title: "Add Person", style: .default) { (_) in
            if let name = alertController.textFields?[0].text {
                PersonController.shared.createPerson(name: name)
                PersonController.shared.save()
                
            }
            self.tableView.reloadData()
        }
        let dismissAction = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        alertController.addAction(action)
        alertController.addAction(dismissAction)
        
        self.present(alertController, animated: true) 
    }

    @IBAction func addBtnTapped(_ sender: Any) {
        presentPerson(title: "Add Person", message: "Add someone new to the list.")
    }
    
    @IBAction func randomizeBtnTapped(_ sender: Any) {
        
    }
    
    
}
