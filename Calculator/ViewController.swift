//
//  ViewController.swift
//  Calculator
//
//  Created by Daniel Kwiatkowski on 2015-06-12.
//  Copyright (c) 2015 Daniel Kwiatkowski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //implicitly wrapped optional
    @IBOutlet weak var displayText: UILabel!
    
    var userIsInTheMiddleOfTypeANumber = false
    
    @IBAction func inputText(sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTypeANumber{
            displayText.text = displayText.text! + digit
        } else {
            displayText.text = digit
            userIsInTheMiddleOfTypeANumber = true
        }
    }
    
    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        if userIsInTheMiddleOfTypeANumber{
            enterButton()
        }
        switch operation{
        case "×":performOperation({ $0 * $1 })
        case "÷":performOperation({ $1 / $0 })
        case "−":performOperation({ $1 - $0 })
        case "+":performOperation({ $0 + $1 })
        case "": performOperation({sqrt($0)})
        default:break
        }
        
    }
    
    func performOperation(operation: (Double, Double) -> Double){
        if operandStack.count >= 2{
            //removes everything from the array once it appends
            displayValue = operation(operandStack.removeLast(),operandStack.removeLast())
            enterButton()
        }
    }
    
    
   private func performOperation(operation: Double -> Double){
        if operandStack.count >= 1{
            displayValue = operation(operandStack.removeLast())
        }
    }
    

    // make and internal stack of numbers
    var operandStack = Array<Double>()
    
    @IBAction func enterButton() {
        userIsInTheMiddleOfTypeANumber = false
        operandStack.append(displayValue)
        println("operandStack = \(operandStack)")
    }
    
    
    var displayValue:Double{
        get {
            return NSNumberFormatter().numberFromString(displayText.text!)!.doubleValue
        }
        set{
            displayText.text = "\(newValue)"
            userIsInTheMiddleOfTypeANumber = false
        }
    }
}

