//
//  ViewController.swift
//  Tippytap
//
//  Created by Pallav Sharda on 3/7/16.
//  Copyright © 2016 Avlokan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var BillAmtField: UITextField!
    
    @IBOutlet weak var ServiceSlider: UISlider!
    
    @IBOutlet weak var TipLabel: UILabel!
    
    @IBOutlet weak var TotalLabel: UILabel!
    
    @IBOutlet weak var TipControl: UISegmentedControl!
  
    @IBOutlet weak var TipSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        BillAmtField.text = "$0.00"
        TipLabel.text = "$0.00"
        TotalLabel.text = "$0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    @IBAction func OnEditingChange(sender: AnyObject) {
        
        var BillAmount: Double?
        var Tip: Double?
        var Total: Double?
        var TipPercentages = [0.10, 0.15, 0.20, 0.25]
        let TipPercentage = TipPercentages[TipControl.selectedSegmentIndex]
        
        
        BillAmount = Double(BillAmtField.text!)
        //Checking if the value was nil, and reseting to zero if yes
        if BillAmount == nil {BillAmount = 0}
        
        Tip = BillAmount! * TipPercentage
        TipLabel.text = "$\(Tip!)"
        TipLabel.text = String(format: "$%.2f", Tip!) //formatting to two decimal

        Total = BillAmount! + Tip!
        TotalLabel.text = "$\(Total!)"
        TotalLabel.text = String(format: "$%.2f", Total!) //formatting to two decimal

    }
    
    // Hiding keyboard if clicking elsewhere
    @IBAction func OnTap(sender: AnyObject) {
    view.endEditing(true)
    }
    
    @IBAction func OnSliderChange(sender: AnyObject) {
        
        var BillAmount: Double?
        var Tip: Double?
        var Total: Double?
        
        BillAmount = Double(BillAmtField.text!)
        //Checking if the value was nil, and reseting to zero if yes
        if BillAmount == nil {BillAmount = 0}
        
        let TipSlide = Double(TipSlider.value/100)
        
        Tip = BillAmount! * TipSlide
        
        TipLabel.text = "$\(Tip!)"
        TipLabel.text = String(format: "$%.2f", Tip!) //formatting to two decimal
        
        Total = BillAmount! + Tip!
        TotalLabel.text = "$\(Total!)"
        TotalLabel.text = String(format: "$%.2f", Total!) //formatting to two decimal
        
    }
    
    
    

}
    
    


