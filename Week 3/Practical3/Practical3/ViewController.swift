//
//  ViewController.swift
//  Practical3
//
//  Created by Mad2 on 29/10/18.
//  Copyright © 2018 kevin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtField: UITextField!
    @IBOutlet weak var myLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        txtField.delegate = self
    }

    @IBAction func onClick(_ sender: Any) {
        myLbl.text = "Button has been clicked"
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        txtField.resignFirstResponder()
        myLbl.text = textField.text
        return true
    }
    
    
}

