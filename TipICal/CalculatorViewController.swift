//
//  ViewController.swift
//  TipICal
//
//  Created by Kent Kawahara on 5/9/17.
//  Copyright © 2017 Kent Kawahara. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
   @IBOutlet weak var billAmountField: UITextField!
   @IBOutlet weak var peopleAmountField: UITextField!
   @IBOutlet weak var tipPercentageSelector: UISegmentedControl!
   @IBOutlet weak var tipAmountLabel: UILabel!
   @IBOutlet weak var totalAmountLabel: UILabel!
   @IBOutlet weak var totalPerPersonAmountLabel: UILabel!
   
   private var tipCalculator = TipCalculatorBrain(tipPercentage: .Fifteen)
   
   private let tipPercentageValues: [TipCalculatorBrain.TipPercentage] = [.Fifteen, .Twenty, .TwentyFive]

   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.
   }
   
   @IBAction func onTap(_ sender: Any) {
      view.endEditing(true)
   }

   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }
   
   @IBAction func calculateTip() {
      let bill = Double(billAmountField.text ?? "") ?? 0
      let tip = tipCalculator.calculateTip(dollarAmount: bill)
      let people = max(1, Int(peopleAmountField.text ?? "") ?? 1)
      let total = bill + tip
      let totalPerPerson = total / Double(people)
      
      tipAmountLabel.text = String(format: "$%.2f", tip)
      totalAmountLabel.text = String(format: "$%.2f", total)
      totalPerPersonAmountLabel.text = String(format: "$%.2f", totalPerPerson)
   }
   
   @IBAction func setTipPercentage() {
      tipCalculator.tipPercentage = tipPercentageValues[tipPercentageSelector.selectedSegmentIndex]
      calculateTip()
   }
}
