// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// Fourth homework assignment

//Embed your main view controller (the one with the table view) in a navigation controller.
//Create a 2nd view controller class and name it DetailViewController.
//Drag out a view controller in storyboard, and set its class to DetailViewController
//Create a show segue from your table view cell to your detail view controller on your storyboard.
//Using prepareForSegue(), pass the person they clicked on in the tableview to the detail view controller
//Show the person's first and last name in separate labels on the detail view controller.


class Person1 {
    
    var firstName: String
    
    init (first : String) {
        self.firstName = first
    }
}

class Person2 {
    
    var firstName: String?
    
    init (first : String) {
        
    }
}



// Dictionaries

// Creating dictionary
var myInfo = ["Seattle" : "Seahawks"]

// Setting a value in a dictionary
myInfo["New York"] = "Giants"
var anotherInfo = ["Miami" : "Dolphins"]

// This concatenation doesn't work
// var thirdInfo = myInfo + anotherInfo

// Access a value in a dictionary
var myTeam =  myInfo["Seattle"]
var superBowlLosers = myInfo["Denver"]

if superBowlLosers != nil {
    
}
// superBowlLosers!.lastPathComponent

var anyInfo = [String : AnyObject]()

// You can store dictionaries inside dictionaries
anyInfo["Extra Dictionary"] = anotherInfo




