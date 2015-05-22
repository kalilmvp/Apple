//
//  Dao.swift
//  eggplant-brownie
//
//  Created by kalilmvp on 5/22/15.
//  Copyright (c) 2015 Alura. All rights reserved.
//

import Foundation

class Dao {

    let mealsArchive:String
    let itemsArchive:String
    
    init() {
        let usersDir = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        let dir = usersDir[0] as! String;

        mealsArchive = "\(dir)/eggplant-brownie-meals"
        itemsArchive = "\(dir)/eggplant-brownie-items"
    }
    
    func saveMeals(meals:Array<Meal>) {
        NSKeyedArchiver.archiveRootObject(meals, toFile: mealsArchive)
    }
    
    func loadMeals() -> Array<Meal> {
        if let loaded = NSKeyedUnarchiver.unarchiveObjectWithFile(mealsArchive) {
            return loaded as! Array;
        }
        
        return Array<Meal>()
    }
    
    func saveItems(items:Array<Item>) {
        NSKeyedArchiver.archiveRootObject(items, toFile: itemsArchive)
    }
    
    func loadItems() -> Array<Item> {
        if let loaded = NSKeyedUnarchiver.unarchiveObjectWithFile(itemsArchive) {
            return loaded as! Array;
        }
        
        return Array<Item>()
    }
}
