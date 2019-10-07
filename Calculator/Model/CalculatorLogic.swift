//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by HOLLY A WALLACE on 10/7/19.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    
    // This tuple could be nil at the point where the object is created,
    // so it must be optional
    private var intermediateCalculation: (firstNumber: Double, calcMethod: String)?
    
    // The underscore represents an external parameter name of blank
    // meaning you don't have to specify the parameter name when you
    // call this function
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        
        if let num = number {

            switch symbol {
            case "+/-":
                return num * -1
            case "AC":
                return 0
            case "%":
                return num * 0.01
            case "=":
                return performTwoNumberCalculation(n2: num)
            default:
                intermediateCalculation = (firstNumber: num, calcMethod: symbol)
            }
        }
        return nil
        
    } // end of calculate method
    
    private func performTwoNumberCalculation(n2: Double) -> Double? {
        
        if let firstNumber = intermediateCalculation?.firstNumber,
            let operation = intermediateCalculation?.calcMethod {
            
            switch operation {
            case "+":
                return firstNumber + n2
            case "-":
                return firstNumber - n2
            case "×":
                return firstNumber * n2
            case "÷":
                return firstNumber / n2
            default:
                fatalError("The operation passed in does not match any of the cases.")
            }
        }
        
        return nil
        
    } // end of performTwoNumberCalculation method
    
} // end CalculatorLogic struct
