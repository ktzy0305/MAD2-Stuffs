//
//  StudentDetailsViewController.swift
//  CTCodes
//
//  Created by Kevin on 11/12/18.
//  Copyright © 2018 kevintoh0305@gmail.com. All rights reserved.
//

import UIKit
import CoreData

class StudentDetailsViewController: UIViewController {

    var students:[NSManagedObject] = []
    var selectedRow:Int = 0
    @IBOutlet weak var studentName: UILabel!
    @IBOutlet weak var studentID: UILabel!
    @IBOutlet weak var modulesLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchFromCoreData()

        let student = students[selectedRow] as! Student
        studentName.text = student.name
        studentID.text = student.studentID
        modulesLabel.text = ""
        let studentModules = student.modules?.allObjects as! [Module]
        for module in studentModules{
            print(module.moduleName!)
            modulesLabel.text = modulesLabel.text! + module.moduleName! + "\n"
        }
        // Do any additional setup after loading the view.
    }
    
    func fetchFromCoreData(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Student")
        do{
            students = try managedContext.fetch(fetchRequest)
        }catch let error as NSError{
            print("Could not fetch \(error)  \(error.userInfo)")
        }
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
