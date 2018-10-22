//
//  ViewController.swift
//  Practical2
//
//  Created by Mad2 on 22/10/18.
//  Copyright © 2018 kevin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lblAverageAge: UILabel!
    var friendsList : [Friend] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        friendsList.append(Friend(firstName: "Random", lastName: "Text", age: 18))
        friendsList.append(Friend(firstName: "Lorem", lastName: "Names", age: 16))
        friendsList.append(Friend(firstName: "Ipsum", lastName: "Tales", age: 8))
        friendsList.append(Friend(firstName: "Test", lastName: "Plans", age: 20))
        friendsList.append(Friend(firstName: "Code", lastName: "Extreme", age: 21))
        displayFriends()
        displayFriendsUnder20()
        print(findAverageAge())
        lblAverageAge.text = "Average age of friends : " + String(findAverageAge())
    }
    
    func displayFriends(){
        for friend in friendsList{
            print(friend.firstName)
        }
    }
    
    func displayFriendsUnder20()
    {
        for friend in friendsList{
            if(friend.age < 20)
            {
                print(friend.firstName)
            }
        }
    }
    
    func findAverageAge()->Double{
        var totalAge = 0
        for friend in friendsList{
            totalAge += friend.age
        }
        return Double(totalAge / friendsList.count)
    }
    
}


