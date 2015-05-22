//
//  Meal.swift
//  eggplant-brownie
//
//  Created by kalilmvp on 5/5/15.
//  Copyright (c) 2015 Alura. All rights reserved.
//

import Foundation

class Meal:NSObject,NSCoding {
    let name:String
    let happiness:Int
    var items = Array<Item>()
    
    init(name:String, happiness:Int) {
        self.name = name;
        self.happiness = happiness;
    }
    
    required init(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObjectForKey("name") as! String;
        self.happiness = aDecoder.decodeIntegerForKey("happiness");
        self.items = aDecoder.decodeObjectForKey("items") as! Array<Item>;
    }
    
    func allCalores() -> Double {
        var total:Double = 0.0
        for i in items {
            total += i.calories
        }
        return total;
    }
    
    func details() -> String {
        var message = "The meal is: \(self.name) and the happiness is: \(self.happiness)"
        
        for item in self.items {
            message += "\n * \(item.name) - calories: \(item.calories)"
        }
        
        println(message)
        
        return message
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.name, forKey: "name")
        aCoder.encodeInteger(self.happiness, forKey: "happiness")
        aCoder.encodeObject(self.items, forKey: "items")
    }
}