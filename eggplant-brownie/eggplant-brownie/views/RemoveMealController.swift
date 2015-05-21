//
//  RemoveMealController.swift
//  eggplant-brownie
//
//  Created by kalilmvp on 5/21/15.
//  Copyright (c) 2015 Alura. All rights reserved.
//

import Foundation
import UIKit

class RemoveMealController {
    let controller:UIViewController
    
    init(controller:UIViewController) {
        self.controller = controller
    }
    
    func show(meal:Meal, handler:(UIAlertAction!) -> Void) {
        let alert:UIAlertController = Alert(controller: controller).createSimpleAlert(meal.name, message: meal.details())
        let remove = UIAlertAction(title: "Remove", style: UIAlertActionStyle.Destructive,
            //usando closure
            handler: handler)
        let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        alert.addAction(remove)
        alert.addAction(cancel)
        controller.presentViewController(alert, animated: true, completion: nil)
    }
    
    
}