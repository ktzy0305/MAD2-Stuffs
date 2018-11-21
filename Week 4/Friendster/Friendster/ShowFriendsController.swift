//
//  ShowFriendsController.swift
//  Friendster
//
//  Created by Mad2 on 7/11/18.
//  Copyright © 2018 kevin. All rights reserved.
//

import Foundation
import UIKit

class ShowFriendsController : UITableViewController {
    var appDelegate = AppDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection: Int)-> Int {
        return appDelegate.friendsList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "FriendCell",for: indexPath)
        let f = appDelegate.friendsList[(indexPath as NSIndexPath).row]
        cell.textLabel?.text = f.firstName
        cell.detailTextLabel?.text = f.lastName
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let alert = UIAlertController(title: "Item selected",
                                      message: "You selected section\(indexPath.section): item \(indexPath.row)", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {(alert: UIAlertAction!) in print("An alert was tapped!")}))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCell.EditingStyle.delete{
            if indexPath.section == 0{
                appDelegate.friendsList.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.fade)
            }
        }
//        else if editingStyle == UITableViewCell.EditingStyle.insert{
//            if indexPath.section == 0{
//                let alert = UIAlertController(title: "Update Friend Details", message: "Update name", preferredStyle: UIAlertController.Style.alert)
//                let confirmAction = UIAlertAction(title: "Update", style: .default){(_) in
//                    let name = alert.textFields?[0].text
//                }
//                let cancelAction = UIAlertAction(title: "Cancel", style:.cancel)
//                //alert.addTextField(configurationHandler: UITextField.)
//
//            }
//        }
    }
}
