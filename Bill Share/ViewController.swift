//
//  ViewController.swift
//  Bill Share
//
//  Created by amrit on 2/1/16.
//  Copyright © 2016 Amrit. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var txtAmount: UITextField! // Enter Bill Amount
    
    @IBOutlet var lblTipPercentage: UILabel! // Tip Percentage
    @IBOutlet var sliderTipPercetage: UISlider! // Tip Percentage Slider
    @IBOutlet var lblnoOfPeople: UILabel! // No of people label
    @IBOutlet var sliderNoOfPeople: UISlider! // No of people Slider
    @IBOutlet var lblFinal: UILabel! // Each Person Bill Amount
    @IBOutlet var lblTotal: UILabel! // Bill Amount before divide
    
   
    var calculate = Calculate(amountBeforeTip: 0, tipPercentage: 0.00, People: 1)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblTipPercentage.text = String(format: "Tip %d%% :", arguments: [Int(calculate.tipPercentage*100)])
        
        
    }

    func calculateTip(){
        calculate.tipPercentage = Float(sliderTipPercetage.value)
        calculate.amountBeforeTip = ((txtAmount.text)! as NSString).floatValue
        calculate.calculateTip()
        updateUI()
    
    }
    
   
    
    func calculateSplit(){
        calculate.noofPeople = sliderNoOfPeople.value
        calculate.totalSplit = calculate.tipAmount+calculate.amountBeforeTip
        calculate.calculateSplit()
        updateUI()
        
    }
    
    @IBAction func txtAmoutValueChanged(sender: AnyObject) {
        calculateTip()
    }

    @IBAction func TipPercentageSliderValueChanged(sender: AnyObject) {
        lblTipPercentage.text! = "Tip %: \(Int(sliderTipPercetage.value*100))"
        calculateTip()
    }
    
    
    @IBAction func noOfPersonValueChanged(sender: AnyObject) {
       
        lblnoOfPeople.text! = "Split: \(Int(sliderNoOfPeople.value))"
        updateUI()
        
       
        
        
    }
    

    
    func updateUI(){
        lblTotal.text = String(format:"Total: $%0.1f Tip: $%0.1f", arguments:[calculate.amountBeforeTip, calculate.tipAmount])
        var a:Int;
        var b: Int;
        b =  Int (calculate.tipAmount + calculate.amountBeforeTip)
        a = Int(sliderNoOfPeople.value)
        print(a)
        lblFinal.text = "Pay $ \(b/a)"
    }

    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
      
        if textField == txtAmount{
            textField.resignFirstResponder()
            calculateTip()
        }
        
        return true
    }
    
    
    
    
    
    
    
    
}

