//
//  TheListViewController.swift
//  The List
//
//  Created by Mad2 on 21/11/18.
//  Copyright © 2018 kevintoh0305@gmail.com. All rights reserved.
//

import Foundation
import UIKit
import CoreData


class TheListViewController : UITableViewController{
    
    var people: [NSManagedObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let context = appDelegate!.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Person")
        do{
            people = try context.fetch(fetchRequest)
        }catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        self.tableView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection numOfRowsInSection: Int) -> Int {
        return people.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let person = people[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
        cell.textLabel?.text = person.value(forKeyPath: "name") as? String
        return cell
    }
    
    @IBAction func btnAdd(_ sender: Any) {
        let alertView = UIAlertController(title: "New Name", message: "Add a new name", preferredStyle: UIAlertController.Style.alert)
        
        alertView.addTextField()
        
        let saveAction = UIAlertAction(title: "Save", style: .default){
            [unowned self] action in
            
            guard let textField = alertView.textFields?.first,
                let nameToSave = textField.text else{
                    return
            }
            
            self.save(name: nameToSave)
            self.tableView.reloadData()
        }
        
        alertView.addAction(saveAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel)
    
        alertView.addAction(cancelAction)
        
        present(alertView, animated: true)
    }
    func save(name: String){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Person", in: managedContext)!
        let person = NSManagedObject(entity: entity, insertInto: managedContext)
        person.setValue(name, forKey: "name")
        appDelegate.saveContext()
        people.append(person)
    }
    
    
}
