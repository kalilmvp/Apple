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

protocol AddAnItemDelegate {
    func addNew(item:Item)
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddAnItemDelegate {
    @IBOutlet var nameField:UITextField!;
    @IBOutlet var happinessField:UITextField!;
    @IBOutlet var tableView:UITableView!;
    
    var delegate:AddAMealDelegate?
    
    var items = Array<Item>()
    
    var selected = Array<Item>()
    
    override func viewDidLoad() {
        let newItemButton = UIBarButtonItem(title: "new item", style: UIBarButtonItemStyle.Plain, target: self, action: Selector("showNewItem"))
        navigationItem.rightBarButtonItem = newItemButton
        
        if let loaded = NSKeyedUnarchiver.unarchiveObjectWithFile(getArchive()) {
            self.items = loaded as! Array
        }
    }
    
    @IBAction func add() {
        println("Button pressed!!");
        
        if let meal = getMealFromFrom() {
            if let meals = delegate {
                delegate!.add(meal)
                
                if let navigation = self.navigationController {
                    navigation.popViewControllerAnimated(true)
                } else {
                    Alert(controller: self).show("Sorry")
                }
                
                return
            }
        }
        
        Alert(controller: self).show("Sorry")
    }
    
    func getMealFromFrom() -> Meal? {
        
        if nameField == nil || happinessField == nil {
            return nil
        }
        
        let name = nameField!.text;
        let happiness = happinessField!.text.toInt();
        
        if happiness == nil {
            return nil
        }
        
        let meal = Meal(name: name, happiness: happiness!)
        meal.items = selected
        
        println("eaten: \(meal.name) - \(meal.happiness) - \(meal.items)");
        
        return meal
    
    }
    
    func addNew(item: Item) {
        items.append(item)
        
        if let table = tableView {
            NSKeyedArchiver.archiveRootObject(self.items, toFile: getArchive())
            tableView.reloadData()
        } else {
            Alert(controller: self).show("Sorry", message: "Unexpected Error")
        }
    }
    
    @IBAction func showNewItem() {
        println("new item")
        
        let newItem = NewItemViewController(delegate: self)
        
        if let navigation = navigationController {
            navigation.pushViewController(newItem, animated: true)
        } else {
            Alert(controller: self).show("Sorry")
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
    
    func getArchive() -> String {
        let usersDir = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        let dir = usersDir[0] as! String;
        
        return "\(dir)/eggplant-brownie-items"
    }
}