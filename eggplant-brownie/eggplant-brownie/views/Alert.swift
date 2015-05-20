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
        let cancel = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Cancel, handler: nil)
        details.addAction(cancel)
        controller.presentViewController(details, animated: true, completion: nil)
    }
}
