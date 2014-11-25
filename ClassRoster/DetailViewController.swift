//
//  DetailViewController.swift
//  ClassRoster
//
//  Created by Patrick Landin on 11/8/14.
//  Copyright (c) 2014 Patrick Landin. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // text field outlets
    @IBOutlet weak var firstNameText: UITextField!
    @IBOutlet weak var lastNameText: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    
    var imagePickerController = UIImagePickerController()
    
    var selectedPerson = Person?()
    // uses the defailt init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Student Profile"
        firstNameText.font = UIFont(name: "Avenir", size: 22)
        lastNameText.font = UIFont(name: "Avenir", size: 22)
        
        //We're becoming the delegate for each text field
        self.firstNameText.delegate = self
        self.lastNameText.delegate = self
        
        // filling names into labels
        self.firstNameText.text = self.selectedPerson?.firstName
        self.lastNameText.text = self.selectedPerson?.lastName
        
        // Saving picture taken to person
        if (self.selectedPerson?.image != nil) {
            self.imageView.image = self.selectedPerson?.image!
            }
        }
    
    //Dismiss the keyboard after user presses return key
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // first thing the user touches becomes the first responder
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func cameraButtonPress(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            self.imagePickerController.sourceType = UIImagePickerControllerSourceType.Camera
            
            self.imagePickerController.delegate = self
            
            self.imagePickerController.allowsEditing = true
            self.presentViewController(self.imagePickerController, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        let image = info[UIImagePickerControllerEditedImage] as UIImage
        
        self.imageView.image = image
        self.selectedPerson?.image = imageView.image
        
        imagePickerController.dismissViewControllerAnimated(true, completion: nil)
    }
    
}