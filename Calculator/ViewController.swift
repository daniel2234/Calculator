//
//  ViewController.swift
//  Calculator
//
//  Created by Daniel Kwiatkowski on 2015-06-12.
//  Copyright (c) 2015 Daniel Kwiatkowski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var displayText: UILabel!
    
    
    @IBAction func inputText(sender: UIButton) {
        let digit = sender.currentTitle!
        println("digit = \(digit)")
        
    }

}

