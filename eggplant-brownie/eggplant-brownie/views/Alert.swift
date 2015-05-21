//
//  Alert.swift
//  eggplant-brownie
//
//  Created by kalilmvp on 5/20/15.
//  Copyright (c) 2015 Alura. All rights reserved.
//

import Foundation
import UIKit

class Alert {
    
    let controller:UIViewController
    
    init(controller:UIViewController) {
        self.controller = controller
    }
    
    func show(title:String, message: String = "Unexpected Error") {
        let details = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        let ok = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Cancel, handler: nil)
        details.addAction(ok)
        controller.presentViewController(details, animated: true, completion: nil)
    }
    
    func showMoreActions(title:String, message: String = "Unexpected Error") {
        let details = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        let remove = UIAlertAction(title: "Remove", style: UIAlertActionStyle.Destructive, handler: nil)
        let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        details.addAction(remove)
        details.addAction(cancel)
        controller.presentViewController(details, animated: true, completion: nil)
    }
    
    func createSimpleAlert(title:String, message:String = "Unexpected Error") -> UIAlertController {
        let details = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        
        return details
    }
    
    func createAlertWithActions(title:String, message: String = "Unexpected Error") -> UIAlertController {
        let details = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        let remove = UIAlertAction(title: "Remove", style: UIAlertActionStyle.Destructive, handler: nil)
        let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        details.addAction(remove)
        details.addAction(cancel)
        
        return details
    }
}
