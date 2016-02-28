//
//  FirstViewController.swift
//  To Do List
//
//  Created by Quan K. Huynh on 2/15/16.
//  Copyright © 2016 QHProductions. All rights reserved.
//

import UIKit

// Array of to do strings
var toDoList = [String]()
var toDoCompleted = [Bool]()

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // The table showing the list of items
    @IBOutlet weak var toDoListTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create a permanent storage for the toDoList if it's not created yet
        if ((NSUserDefaults.standardUserDefaults().objectForKey("toDoList")) != nil) {
            toDoList = NSUserDefaults.standardUserDefaults().objectForKey("toDoList") as! [String]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(animated: Bool) {
        // Reload the table when the view appear to update new content
        toDoListTable.reloadData()
    }
    
    internal func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Number of rows is the number of items
        return toDoList.count
    }
    
    
    internal func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        // Set the text of each label in the cells as a to do item
        cell.textLabel?.text = toDoList[indexPath.row]
        
        if (toDoCompleted[indexPath.row]) {
            cell.accessoryType = .Checkmark
        } else{
            cell.accessoryType = .None
        }
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath:
        
        NSIndexPath) {
            tableView.deselectRowAtIndexPath(indexPath, animated: false)
            
            if (toDoCompleted[indexPath.row] == true) {
                toDoCompleted[indexPath.row] = false
            } else {
                toDoCompleted[indexPath.row] = true
            }
            
            tableView.reloadData()
    }
    
    internal func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        // Detect a swipe left by the user to show a delete button
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            // Delete the item in the array
            toDoList.removeAtIndex(indexPath.row)
            toDoCompleted.removeAtIndex(indexPath.row)
            
            // Remove the item from permanent storage
            NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
            
            // Update the content in the table after deletion
            toDoListTable.reloadData()
        }
        
    }
    
}

