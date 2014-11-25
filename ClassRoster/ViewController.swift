//
//  ViewController.swift
//  ClassRoster
//
//  Created by Patrick Landin on 11/8/14.
//  Copyright (c) 2014 Patrick Landin. All rights reserved.

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
        var names = [Person]()
        // backing array

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let peopleFromArchive = self.loadFromArchive() as [Person]? {
            self.names = peopleFromArchive
        } else {
            self.loadFromPlist()
            self.saveToArchive()
        }
        
        var hasLaunched = NSUserDefaults.standardUserDefaults().boolForKey("firstTime") as Bool
                if hasLaunched == false {
                    // this is for first launch
                    println("first launch")
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "firstTime")
        }
        
//        // User defaults to check if it's the first time the user has launched the app
//        
////        var hasLaunched = false
//        NSUserDefaults.standardUserDefaults().setBool(hasLaunched, forKey: "firstTime")
//        // Calls save
//        NSUserDefaults.standardUserDefaults().synchronize()
//    
        self.title = "Class Roster"
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
    }
    
        override func viewWillAppear(animated: Bool) {
            super.viewWillAppear(animated)
            self.tableView.reloadData()
            self.saveToArchive()
        }
    
    
    // Loading data from archive
    func loadFromArchive() -> [Person]? {
        let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        
        if let peopleFromArchive = NSKeyedUnarchiver.unarchiveObjectWithFile(documentsPath + "/archive") as? [Person] {
            return peopleFromArchive
        }
        return nil
    }
    
    // Saving data to archive after user interaction
    func saveToArchive() {
        //get path to documents directory
        let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) [0] as String
        //archive
        NSKeyedArchiver.archiveRootObject(self.names, toFile: documentsPath + "/archive")
    }
    
    
    // Loading class list from plist
    func loadFromPlist() {
        
        let plistURL = NSBundle.mainBundle().pathForResource("Roster", ofType: "plist")
        
        let plistArray = NSArray(contentsOfFile: plistURL!)
        
        for object in plistArray! {
            println("looped")
            if let personDictionary = object as? NSDictionary   {
                    let firstName = personDictionary["First Name"] as String
                    let lastName =  personDictionary["Last Name"] as String
                var person = Person(first: firstName, last: lastName)
                self.names.append(person)
            }
        }
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.names.count
            // how many cells?
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PERSON_CELL", forIndexPath: indexPath) as PersonTableViewCell  // Cast it as our custom cell
    
        var personToDisplay = self.names[indexPath.row]

        cell.nameLabel.text = personToDisplay.firstName
        cell.nameLabel.font = UIFont(name: "Avenir", size: 24)
        cell.subNameLabel.text = personToDisplay.lastName
        cell.subNameLabel.font = UIFont(name: "Avenir", size: 24)
        cell.personImageView.image = personToDisplay.image
        
        return cell
            // what goes in the cells?
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SHOW_DETAIL" {
            let detailViewController = segue.destinationViewController as DetailViewController
            let selectedIndexPath = self.tableView.indexPathForSelectedRow()
            var nameToPass = self.names[selectedIndexPath!.row]
            detailViewController.selectedPerson = nameToPass
        }
    }
}

