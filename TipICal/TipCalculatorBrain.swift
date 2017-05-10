//
//  TipCalculatorBrain.swift
//  TipICal
//
//  Created by Kent Kawahara on 5/9/17.
//  Copyright © 2017 Kent Kawahara. All rights reserved.
//

import Foundation

class TipCalculatorBrain {
   public enum TipPercentage: Double {
      case Fifteen = 0.15
      case Twenty = 0.20
      case TwentyFive = 0.25
   }
   
   init() {
      self.tipPercentage = nil
   }
   
   init(tipPercentage: TipPercentage) {
      self.tipPercentage = tipPercentage
   }
   
   private var tipPercentageValue: Double?
   
   public var tipPercentage: TipPercentage? {
      get {
         if let rawValue = tipPercentageValue {
            return TipPercentage.init(rawValue: rawValue)
         }
         return nil
      }
      set {
         tipPercentageValue = newValue?.rawValue
      }
   }
   
   public func calculateTip(dollarAmount: Double) -> Double {
      let percentage = tipPercentageValue ?? 0
      return percentage * dollarAmount
   }
}
