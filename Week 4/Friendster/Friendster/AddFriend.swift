//
//  AddFriend.swift
//  Friendster
//
//  Created by Mad2 on 7/11/18.
//  Copyright © 2018 kevin. All rights reserved.
//

import Foundation
import UIKit

class AddFriend : UIViewController {
    
    @IBOutlet weak var nameTxtFld: UITextField!
    @IBOutlet weak var addressTxtFld: UITextField!
    @IBOutlet weak var ageTxtFld: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad();
    }
    
    @IBAction func addClick(_ sender: Any) {
        print("Add Clicked")
        let age:Int? = Int(ageTxtFld.text!)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        print(String(appDelegate.friendsList.count))
        appDelegate.friendsList.append(Friend(firstName: nameTxtFld.text!, lastName: nameTxtFld.text!, age: age!))
    }
}
