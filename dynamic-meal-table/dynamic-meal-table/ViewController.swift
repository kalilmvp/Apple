//
//  ViewController.swift
//  dynamic-meal-table
//
//  Created by kalilmvp on 5/8/15.
//  Copyright (c) 2015 Alura. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    let meals = ["Meal 1", "Meal 2", "Meal 3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("view table");
    }
        
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let row = indexPath.row
        let meal = meals[row]
        
        var cell = UITableViewCell(
                         style: UITableViewCellStyle.Default,
                         reuseIdentifier: nil)
        
        cell.textLabel?.text = meal
        return cell
    }
}

