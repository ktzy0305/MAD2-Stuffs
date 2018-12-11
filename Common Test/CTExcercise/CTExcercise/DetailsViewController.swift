//
//  DetailsViewController.swift
//  CTExcercise
//
//  Created by Kevin on 11/12/18.
//  Copyright © 2018 kevintoh0305@gmail.com. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    var selectedIndex = 0
    @IBOutlet weak var contactName: UILabel!
    @IBOutlet weak var contactNumber: UILabel!
    @IBOutlet weak var imageDetails: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let contact = appDelegate?.contactList[selectedIndex]
        imageDetails.image = contact?.photo
        contactName.text = "\((contact?.firstname)!) \((contact?.lastname)!)"
        contactNumber.text = contact?.telephone
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
