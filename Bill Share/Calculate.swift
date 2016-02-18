//
//  Calculate.swift
//  Bill Share
//
//  Created by amrit on 2/1/16.
//  Copyright © 2016 Amrit. All rights reserved.
//

import Foundation

class Calculate{
    var tipAmount: Float = 0
    var amountBeforeTip: Float = 0
    var tipPercentage: Float = 0
    var totalAmount: Float = 0
    var noofPeople: Float = 0
    var totalSplit: Float = 0;
    
    
    init(amountBeforeTip:Float, tipPercentage:Float, People:Float){
        self.amountBeforeTip = amountBeforeTip
        self.tipPercentage = tipPercentage
        self.noofPeople = People
    }
    
    
    func calculateTip(){
        
        tipAmount = amountBeforeTip * tipPercentage
        totalAmount = tipAmount + amountBeforeTip
        
    }
    
    func calculateSplit(){
        totalSplit = Float(totalAmount/noofPeople);
    
    }
    
    
}