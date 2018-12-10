//
//  ContactDetailsViewController.swift
//  CTExcercise
//
//  Created by Mad2 on 5/12/18.
//  Copyright © 2018 kevintoh0305@gmail.com. All rights reserved.
//

import UIKit

class ContactDetailsViewController: UIViewController {
    //Outlets
    @IBOutlet weak var imgContact: UIImageView!
    @IBOutlet weak var txtContactName: UILabel!
    @IBOutlet weak var txtContactPhoneNumber: UILabel!
    var choice = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let selectedContact = appDelegate.contactList[choice]
        imgContact.image = selectedContact.photo
        txtContactName.text = selectedContact.firstname + " " + selectedContact.lastname
        txtContactPhoneNumber.text = selectedContact.telephone
        // Do any additional setup after loading the view.
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
