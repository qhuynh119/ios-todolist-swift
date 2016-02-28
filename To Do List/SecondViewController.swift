//
//  SecondViewController.swift
//  To Do List
//
//  Created by Quan K. Huynh on 2/15/16.
//  Copyright © 2016 QHProductions. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var item: UITextField!
    
    @IBAction func addItem(sender: AnyObject) {
        // Check if the user has entered a name for the item
        if (item.text != "") {
            // Add the text in the text field to the toDoList array,
            // then set the text field blank
            toDoList.append(item.text!)
            toDoCompleted.append(false)
            item.text = "";
            
            // Save the item in permanent storage
            NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
        } else {
            // Show an alert message if the user try to add a blank item
            let alert = UIAlertController(title: "Alert", message: "Please enter a name for the item", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide the keyboard when the user hit the Return button
        item.resignFirstResponder()
        
        return true
    }
    
}

