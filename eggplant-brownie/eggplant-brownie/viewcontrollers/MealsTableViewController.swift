//
//  MealsTableViewController.swift
//  eggplant-brownie
//
//  Created by kalilmvp on 5/11/15.
//  Copyright (c) 2015 Alura. All rights reserved.
//

import UIKit

class MealsTableViewController: UITableViewController, AddAMealDelegate {
    var meals = [ Meal(name: "Meal 1", happiness: 1),
                  Meal(name: "Meal 2", happiness: 2),
                  Meal(name: "Meal 3", happiness: 3)];
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let row = indexPath.row
        let meal = meals[row]
        
        var cell = UITableViewCell(
                style: UITableViewCellStyle.Default,
            reuseIdentifier: nil)
        cell.textLabel?.text = meal.name
        return cell
    }
    
    func add(meal:Meal) {
        println("Meal added: \(meal)")
        meals.append(meal)
        tableView.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "addMeal") {
            let view = segue.destinationViewController as! ViewController
            view.delegate = self
        }
    }
}
