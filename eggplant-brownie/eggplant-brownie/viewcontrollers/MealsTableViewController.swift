//
//  MealsTableViewController.swift
//  eggplant-brownie
//
//  Created by kalilmvp on 5/11/15.
//  Copyright (c) 2015 Alura. All rights reserved.
//

import UIKit

class MealsTableViewController: UITableViewController, AddAMealDelegate {
    var meals = Array<Meal>()
    
    override func viewDidLoad() {
        if let loaded = NSKeyedUnarchiver.unarchiveObjectWithFile(getArchive()) {
            self.meals = loaded as! Array
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let row = indexPath.row
        let meal = meals[row]
        
        let longPress = UILongPressGestureRecognizer(target: self, action: Selector("showDetails:"))
        
        var cell = UITableViewCell(
                style: UITableViewCellStyle.Default,
            reuseIdentifier: nil)
        cell.addGestureRecognizer(longPress)
        cell.textLabel?.text = meal.name
        return cell
    }
    
    func add(meal:Meal) {
        println("Meal added: \(meal)")
        meals.append(meal)
        NSKeyedArchiver.archiveRootObject(meals, toFile: getArchive())
        tableView.reloadData()
    }
    
    func getArchive() -> String {
        let usersDir = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        let dir = usersDir[0] as! String;
        
        return "\(dir)/eggplant-brownie-meals"
    }
    
    func showDetails(recognizer:UILongPressGestureRecognizer) {
        if recognizer.state == UIGestureRecognizerState.Began {
            let cell = recognizer.view as! UITableViewCell
            let indexPath = tableView.indexPathForCell(cell)
            
            if indexPath == nil {
                return
            }
            
            let row = indexPath!.row
            let meal = meals[row]
            
            RemoveMealController(controller: self).show(meal, handler: { action in
                self.meals.removeAtIndex(row)
                self.tableView.reloadData()
            })
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "addMeal") {
            let view = segue.destinationViewController as! ViewController
            view.delegate = self
        }
    }
}
