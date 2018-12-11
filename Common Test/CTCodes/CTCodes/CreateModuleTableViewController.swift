//
//  CreateModuleTableViewController.swift
//  CTCodes
//
//  Created by Kevin on 9/12/18.
//  Copyright © 2018 kevintoh0305@gmail.com. All rights reserved.
//

import UIKit
import CoreData

class CreateModuleTableViewController: UITableViewController {

    var modules = [Module]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    // MARK: - Table view data source
    
    override func viewDidAppear(_ animated: Bool) {
        refreshTable()
    }
    
    func fetchModules(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Module")
        do{
            modules = try managedContext.fetch(fetchRequest) as! [Module]
        }catch let error as NSError{
            print("Could not fetch \(error) \(error.userInfo)")
        }
    }
    
    func refreshTable(){
        fetchModules()
        tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return modules.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ModuleCell", for: indexPath)
        cell.textLabel?.text = modules[indexPath.row].moduleName
        // Configure the cell...
        return cell
    }
    
    @IBAction func addModule(_ sender: Any) {
        let alert = UIAlertController(title: "New module", message: "Add a new module", preferredStyle: .alert)
        alert.addTextField{(textField) in
            textField.placeholder = "Enter a new module name"}
        
        let saveAction = UIAlertAction(title: "Save", style: .default, handler: {action in
            self.saveModule(name: (alert.textFields?.first?.text)!)})
        
        alert.addAction(saveAction)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    func saveModule(name: String) -> Void{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let module = Module(context: managedContext)
        module.moduleName = name
        appDelegate.saveContext()
        refreshTable()
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
