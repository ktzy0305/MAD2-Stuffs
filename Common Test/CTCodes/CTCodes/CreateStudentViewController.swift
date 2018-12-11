//
//  CreateStudentViewController.swift
//  CTCodes
//
//  Created by Kevin on 9/12/18.
//  Copyright © 2018 kevintoh0305@gmail.com. All rights reserved.
//

import UIKit
import CoreData

class CreateStudentViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var modules = [Module]()
    var filteredModules = [Module]()
    
    //Outlets
    
    @IBOutlet weak var txtStudentName: UITextField!
    @IBOutlet weak var txtStudentID: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        tableView.allowsMultipleSelection = true
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        fetchModules()
        tableView.reloadData()
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
    
    //Actions
    
    @IBAction func btnCreate(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let student = Student(context: managedContext)
        
        student.name = txtStudentName.text!
        student.studentID = txtStudentID.text!
        let indexPaths = self.tableView.indexPathsForSelectedRows
        for indexPath in indexPaths! {
            modules[indexPath.row].addToStudents(student)
        }
        appDelegate.saveContext()
        
        let alert = UIAlertController(title: "Done", message: "Added successfully.", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Ok", style: .cancel)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /*
        if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCell.AccessoryType.checkmark{
            print(1)
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.none
        }
        else{
            print(2)
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
        }
        */
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modules.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentModuleCell", for: indexPath)
        cell.textLabel?.text = modules[indexPath.row].moduleName
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
