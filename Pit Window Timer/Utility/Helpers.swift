//
//  Helpers.swift
//  Pit Window Timer
//
//  Created by Anthony Gibson on 24/03/2023.
//

import SwiftUI

let feedback = UIImpactFeedbackGenerator(style: .heavy)

func getTime(seconds: Int) -> String {
   let hrsLeft = seconds / 3600
   let minLeft = (seconds % 3600) / 60
   let secLeft = seconds % 60
   
   let hrsLeftStr = hrsLeft < 10 ? "0" + String(hrsLeft) : String(hrsLeft)
   let minLeftStr = minLeft < 10 ? "0" + String(minLeft) : String(minLeft)
   let secLeftStr = secLeft < 10 ? "0" + String(secLeft) : String(secLeft)
   
   return (hrsLeftStr + ":" + minLeftStr + ":" + secLeftStr)
}

func ??<T>(lhs: Binding<Optional<T>>, rhs: T) -> Binding<T> {
   Binding(
      get: { lhs.wrappedValue ?? rhs },
      set: { lhs.wrappedValue = $0 }
   )
}

extension String {
   func substring(index: Int) -> String {
      let arrayString = Array(self)
      return String(arrayString[index])
   }
}

