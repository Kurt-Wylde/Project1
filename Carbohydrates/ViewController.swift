//
//  ViewController.swift
//  Carbohydrates
//
//  Created by Evgeny Koshkin on 21.10.2021.
//

import UIKit
import Foundation



class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var carbs_input: UITextField!
    @IBAction func carbs_input_done(_ sender: Any) {
        //do I need something here?
    }
    @IBOutlet weak var weight_input: UITextField!
    @IBAction func weight_input_done(_ sender: Any) {
        //do I need something here?
    }
    @IBAction func button(_ sender: Any) {
        
        self.view.endEditing(true) //hides keyboard when button is pressed
        
        func getDoubleFromLocalNumber(input: String) -> Double {
            var value = 0.0
            let numberFormatter = NumberFormatter()
            let decimalFiltered = input.replacingOccurrences(of: "٫|,", with: ".", options: .regularExpression)
            numberFormatter.locale = Locale(identifier: "EN")
            if let amountValue = numberFormatter.number(from: decimalFiltered) {
                value = amountValue.doubleValue
            }
            return value
        }
        let carbs_in_100g: Double = getDoubleFromLocalNumber(input: carbs_input.text!)
        let weight: Double = getDoubleFromLocalNumber(input: weight_input.text!)
        var result: Double = ((carbs_in_100g / 100) * weight) / 10
        print("result is:", result)
        result = round(100 * result) / 100
        result_output.text = String(result) + " ХЕ"
        print("rounded result is:", result)
    }
    @IBOutlet weak var result_output: UILabel!
    override func viewDidLoad() {
        //carbs_input.delegate = self
        
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
         view.addGestureRecognizer(tapGesture)
        
        super.viewDidLoad()
        
    }
    
    
    //this is unused!!
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let isNumber = CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: string))
        let withDecimal = (
            string == NumberFormatter().decimalSeparator &&
            textField.text?.contains(string) == false
        )
        return isNumber || withDecimal
    }
    // this is unused!!

}

