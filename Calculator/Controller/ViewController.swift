//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2018.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!

    private var isFinishedTypingNumber: Bool = true
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text to a Double.")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    private var calculator = CalculatorLogic()
    
    // When you tap a non-number button...
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        isFinishedTypingNumber = true
        
        calculator.setNumber(displayValue)
        
        // Which button got pressed
        if let calcMethod = sender.currentTitle {
            
            if let result = calculator.calculate(symbol: calcMethod) {
                displayValue = result
            }
        }
    
    }

    // When you tap a number button...
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let numValue = sender.currentTitle {
            
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            }
            else {
                // Don't let user enter more than one decimal, so if they have
                // clicked on the decimal point button, you want to check if
                // they have entered a double (so therefore no more decimal
                // points allowed), or an integer, so far.
                if numValue == "." {

                    // round down - this is a sneaky way of figuring out if
                    // the currentDisplayValue is an integer or not
                    let isInt = floor(displayValue) == displayValue
                    
                    // If the current displayed value is not an integer, don't let
                    // the user add another decimal point
                    if !isInt {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + numValue
            }
        }
        
    } // end of numButtonPressed method


} // end of ViewController class

