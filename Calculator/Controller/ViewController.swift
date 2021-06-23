//
//  ViewController.swift
//  Calculator
//
//  Created by Amit on 10/09/2019.
//  Copyright © 2019 Amit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypyingNumber:Bool = true
    private var calculator = CalculatorLogic()
    
    private var displayValue:Double {
        get {
            guard let currentDisplayLabelValue = Double(displayLabel.text!) else{
                fatalError("Can not convert display label text to double")
            }
            return currentDisplayLabelValue
        }
        
        set {
            self.displayLabel.text = String(newValue)
        }
    }
        
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        isFinishedTypyingNumber = true
        self.calculator.setNumber(displayValue)
        if let calcMethod = sender.currentTitle {
            
            if let result = calculator.calculate(symbol: calcMethod){
                self.displayValue = result
            }

//            guard let result = calculator.calculate(symbol: calcMethod) else {
//                fatalError("The result of the calculation is nill")
//            }
            
        }
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        if let numValue = sender.currentTitle {
            if (isFinishedTypyingNumber) {
                displayLabel.text =  numValue
                isFinishedTypyingNumber = false
            }else{
                
                if numValue == "." {
                    
                    let isInt = floor(displayValue) == displayValue
                    
                    if isInt {
                        return
                    }
                }
                
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    
    }

}

