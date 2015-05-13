//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by kalilmvp on 5/4/15.
//  Copyright (c) 2015 Alura. All rights reserved.
//

import UIKit

protocol AddAMealDelegate {
    func add(meal:Meal)
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var nameField:UITextField!;
    @IBOutlet var happinessField:UITextField!;
    
    var delegate:AddAMealDelegate?
    
    var items = [
                    Item(name: "Food 1", calories: 1.0),
                    Item(name: "Food 2", calories: 2.0),
                    Item(name: "Food 3", calories: 3.0),
                    Item(name: "Food 4", calories: 4.0),
    ]
    
    var selected = Array<Item>()
    
    @IBAction func add() {
        println("Button pressed!!");
        
        if nameField == nil || happinessField == nil {
            return
        }
        
        let name = nameField!.text;
        let happiness = happinessField!.text.toInt();
        
        if happiness == nil {
            return
        }
    
        let meal = Meal(name: name, happiness: happiness!)
        meal.items = selected
        
        println("eaten: \(meal.name) - \(meal.happiness) - \(meal.items)");
        
        if delegate == nil {
            return
        }
        
        delegate!.add(meal)
        
        if let navigation = self.navigationController {
            navigation.popViewControllerAnimated(true)
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let row = indexPath.row
        let item = items[row]
        
        var cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        cell.textLabel!.text = item.name
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        
        if (cell?.accessoryType == UITableViewCellAccessoryType.None) {
            cell?.accessoryType = UITableViewCellAccessoryType.Checkmark
            selected.append(items[indexPath.row])
        } else {
            cell?.accessoryType = UITableViewCellAccessoryType.None
            if let position =  find(selected, items[indexPath.row]) {
                selected.removeAtIndex(position)
            }
        }
    }
}