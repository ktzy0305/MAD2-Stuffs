//
//  ViewController.swift
//  Friendster
//
//  Created by Mad2 on 5/11/18.
//  Copyright © 2018 kevin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usrNameFld: UITextField!
    @IBOutlet weak var pwdFld: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func onclick(_ sender: Any) {
        let storyboard = UIStoryboard(name: "AppStoryboard", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AppView") as UIViewController
        present(vc, animated: true, completion: nil)
    }
}

