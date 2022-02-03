//
//  CalculatorBrain.swift
//  BMI Calculator


import UIKit

struct CalculatorBrain {
    
    var bmi: BMI?
    
    let color = (underweight: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1), healthy: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), overweight: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1), defaultcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) // #colorLiteral(
    
    mutating func getBMIValue() -> String {
        // Default value in case of nil
        let bmiValueTo1Decimal = String(format: "%.1f", bmi?.value ?? 0.0) // Nil Coalescing operator
        return bmiValueTo1Decimal
    }
    
    mutating func calculateBMI(weight: Float, height: Float) {
        let bmiValue = weight / (height * height)
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "You are underweight!", color: color.underweight)
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Congratulations! Your BMI is perfect!", color: color.healthy)
        } else {
            bmi = BMI(value: bmiValue, advice: "You are overweight!", color: color.overweight)
        }
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "Oops!"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? color.defaultcolor
    }
    
}
