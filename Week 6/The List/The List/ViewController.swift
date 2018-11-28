//
//  ViewController.swift
//  The List
//
//  Created by Mad2 on 21/11/18.
//  Copyright © 2018 kevintoh0305@gmail.com. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let p = Person(context: context)
        //let context = appDelegate.getContext()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
}

