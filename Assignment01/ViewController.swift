//
//  ViewController.swift
//  Assignment01
//
//  Created by Meet Patel on 27/09/24.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var unitSwitch: UISwitch!
    
    @IBOutlet weak var BMI_Calculator: UILabel!
  
    @IBOutlet weak var heightTextField: UITextField!
    
    @IBOutlet weak var heightTextField1: UITextField!
    
    @IBOutlet weak var inchTextField: UITextField!
    
    @IBOutlet weak var weightTextField: UITextField!
    
    @IBOutlet weak var weightTextField1: UITextField!
    
    @IBOutlet weak var bmiLabel: UILabel!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var bmiLabel1: UILabel!
    
    @IBOutlet weak var resultLabel2: UITextField!
    
    @IBOutlet weak var resultLabel1: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
     @IBAction func unitSwitch(_ sender: Any) {
         
         if unitSwitch.isOn {
            // If the switch is ON, show metric inputs and hide imperial inputs
       
             heightTextField1.isHidden = false // Height in feet
             heightTextField1.placeholder = "centimeters"
             inchTextField.isHidden = true // Inches
             weightTextField1.placeholder = "kilograms"
           
        } else {
            // If the switch is OFF, show imperial inputs and hide metric inputs
            heightTextField1.placeholder = "feets"
            inchTextField.isHidden = false // Inches
            weightTextField1.placeholder = "pounds"
           
        }
        
    }

    @IBAction func calculateBMI(_ sender: Any) {
        calculateBMI()
    }
    
    private func calculateBMI() {
            var heightInMeters: Double = 0.0
            var weightInKilograms: Double = 0.0
            
            if unitSwitch.isOn { // Metric System (cm and kg)
                guard let heightText = heightTextField1.text,
                      let weightText = weightTextField1.text,
                      let height = Double(heightText),
                      let weight = Double(weightText) else {
                    bmiLabel1.text = "Invalid input"
                    resultLabel1.text = ""
                    return
                }
                heightInMeters = height / 100 // Convert cm to meters
                weightInKilograms = weight // Weight is already in kg
                
            } else { // Imperial System (feet, inches, pounds)
                guard let feetText = heightTextField1.text,
                      let inchesText = inchTextField.text,
                      let weightText = weightTextField1.text,
                      let feet = Double(feetText),
                      let inches = Double(inchesText),
                      let weight = Double(weightText) else {
                    bmiLabel1.text = "Invalid input"
                    resultLabel1.text = ""
                    return
                }
                let totalHeightInInches = (feet * 12) + inches
                            heightInMeters = totalHeightInInches * 0.0254 // Convert inches to meters
                            weightInKilograms = weight * 0.453592 // Convert pounds to kilograms
                        }
                        
                        // Calculate BMI
                        let calculatedBMI = weightInKilograms / (heightInMeters * heightInMeters)
                        let formattedBMI = String(format: "%.2f", calculatedBMI)
                        bmiLabel1.text = " \(formattedBMI)"
        
        // Determine the result
        switch calculatedBMI {
        case 0..<18.5:
            resultLabel1.text = "Underweight"
        case 18.5..<24.9:
            resultLabel1.text = "Normal weight"
        case 25..<29.9:
            resultLabel1.text = "Overweight"
        case 30..<34.9:
            resultLabel1.text = "Obesity (Class 1)"
        case 35..<39.9:
            resultLabel1.text = "Obesity (Class 2)"
        default:
            resultLabel1.text = "Extremely obese"
            
            
            
        }
    }
    
}


