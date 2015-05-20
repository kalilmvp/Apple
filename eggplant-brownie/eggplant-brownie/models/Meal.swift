//
//  Meal.swift
//  eggplant-brownie
//
//  Created by kalilmvp on 5/5/15.
//  Copyright (c) 2015 Alura. All rights reserved.
//

import Foundation

class Meal {
    let name:String
    let happiness:Int
    var items = Array<Item>()
    
    init(name:String, happiness:Int) {
        self.name = name;
        self.happiness = happiness;
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
}

