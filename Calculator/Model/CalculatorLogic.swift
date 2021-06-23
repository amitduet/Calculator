//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Amit Chowdhury on 2021/06/08.
//  Copyright © 2021 Amit. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number:Double?
    
    private var intermidateCalculator:(n1:Double, calMethod:String)?
    
    mutating func setNumber(_ number:Double) {
        self.number = number
    }
    
    mutating func calculate(symbol:String) -> Double?{

        if let n = number {
            switch symbol {
            case "+/-":
                return n * -1
            case "AC":
                return n * -1
            case "%":
                return n * 0.01
            case "=":
                return performCalculateMethod(n2:n)
            default:
                intermidateCalculator = (n1:n,calMethod:symbol)
            }
        }
        return nil
    }
    
    func performCalculateMethod(n2:Double) -> Double?{
        
        if let n1 = intermidateCalculator?.n1, let operation = intermidateCalculator?.calMethod {
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                fatalError("The operation passed in does not match any of cases.")
            }
        }
        return nil
    }
}
