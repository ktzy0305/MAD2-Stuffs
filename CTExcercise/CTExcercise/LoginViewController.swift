//
//  LoginViewController.swift
//  CTExcercise
//
//  Created by Mad2 on 3/12/18.
//  Copyright © 2018 kevintoh0305@gmail.com. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    //Outlets AKA Variables
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    //Actions AKA buttons
    @IBAction func btnLogin(_ sender: Any) {
        if(!((txtEmail.text?.isEmpty)! || (txtPassword.text?.isEmpty)!)){
            let appDelegate = UIApplication.shared.delegate as? AppDelegate
            let context = appDelegate!.persistentContainer.viewContext
            do{
               let results = try context.fetch(Account.fetchRequest())
                if results.count > 0{
                    let accounts = results as! [Account]
                    for account in accounts{
                        if(txtEmail.text == account.email && txtPassword.text == account.password)
                        {
                            let vc = self.storyboard?.instantiateViewController(withIdentifier: "grnavcontroller")
                            present(vc!, animated: false, completion: nil)
                        }
                    }
                }
                else{
                    let alertView = UIAlertController(title: "Error", message: "Account not found", preferredStyle: .alert)
                    alertView.addAction(UIAlertAction(title:"Ok",
                                                      style: UIAlertAction.Style.default,
                                                      handler: nil))
                    self.present(alertView, animated: true, completion: nil)
                }
            }
            catch{
                print("error")
            }
            
        
        }
        else{
            let alertView = UIAlertController(title: "Error", message: "Email and Password cannot be empty", preferredStyle: .alert)
            alertView.addAction(UIAlertAction(title:"Ok",
                                              style: UIAlertAction.Style.default,
                                              handler: nil))
            self.present(alertView, animated: true, completion: nil)
        }
        
        //let vc = self.storyboard?.instantiateViewController(withIdentifier: "grnavcontroller")
        //present(vc!, animated: false, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
