//
//  NewItemViewController.swift
//  eggplant-brownie
//
//  Created by kalilmvp on 5/18/15.
//  Copyright (c) 2015 Alura. All rights reserved.
//

import UIKit

class NewItemViewController: UIViewController {
    @IBOutlet var nameField:UITextField?
    @IBOutlet var caloriesField:UITextField?
    
    let delegate:AddAnItemDelegate?
    
    init(delegate:AddAnItemDelegate) {
        self.delegate = delegate
        super.init(nibName: "NewItemViewController", bundle: nil)
    }

    required init(coder aDecoder: NSCoder) {
        //TODO nao esta funcionando
        //super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    @IBAction func addNewItem() {
        if nameField == nil || caloriesField == nil {
            return
        }
        
        let name = nameField?.text
        let calories = NSString(string: caloriesField!.text).doubleValue
        let item = Item(name: name!, calories: calories)
        
        if delegate == nil {
            return
        }
        
        delegate?.addNew(item)
        
        if let navigation = navigationController {
            navigation.popViewControllerAnimated(true)
        }
    }
}
