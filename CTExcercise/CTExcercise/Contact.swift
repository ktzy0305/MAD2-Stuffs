//
//  Contact.swift
//  CTExcercise
//
//  Created by Mad2 on 3/12/18.
//  Copyright © 2018 kevintoh0305@gmail.com. All rights reserved.
//

import Foundation
import UIKit

public class Contact{
    var firstname:String
    var lastname:String
    var photo:UIImage
    var telephone:String
    
    public init(firstname: String, lastname: String, photo:UIImage, telephone:String) {
        self.firstname = firstname
        self.lastname = lastname
        self.photo = photo
        self.telephone = telephone
    }
}
