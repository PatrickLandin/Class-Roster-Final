//
//  Person.swift
//  ClassRoster
//
//  Created by Patrick Landin on 11/8/14.
//  Copyright (c) 2014 Patrick Landin. All rights reserved.
//

import Foundation
import UIKit

// I have taken out isStudent to make Plist integration more simple

class Person : NSObject, NSCoding {
    
    var firstName : String
    var lastName : String
    var image : UIImage?
    
    override init() {
        self.firstName = "Patrick"
        self.lastName = "Landin"
    }
    
    init (first: String, last: String) {
        self.firstName = first
        self.lastName = last
    }
    
    // return the first and last names in a string
    func returnFullName() -> String {
        return "\(self.firstName) \(self.lastName)"
    }
    
    // initialize our archived data
    required init(coder aDecoder: NSCoder) {
        self.firstName = aDecoder.decodeObjectForKey("firstName") as String
        self.lastName = aDecoder.decodeObjectForKey("lastName") as String
        if let decodedImage = aDecoder.decodeObjectForKey("image") as? UIImage {
            self.image  = decodedImage
        }
    }
    
    // Save data to our archive
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.firstName, forKey: "firstName")
        aCoder.encodeObject(self.lastName, forKey: "lastName")
        if self.image != nil {
        aCoder.encodeObject(self.image!, forKey: "image")
        } else {
            aCoder.encodeObject(nil, forKey: "image")
        }
    }
    
} // Person()



