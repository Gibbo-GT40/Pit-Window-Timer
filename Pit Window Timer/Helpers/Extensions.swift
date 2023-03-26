//
//  Extensions.swift
//  Pit Window Timer
//
//  Created by Anthony Gibson on 24/03/2023.
//

import SwiftUI

let window1Open: Int = 2 * 60
let window1Close: Int = 20 * 60
let window1Range = window1Open...window1Close

let window2Open: Int = 25 * 60
let window2Close: Int = 45 * 60
let window2Range = window2Open...window2Close

let window3Open: Int = 50 * 60
let window3Close: Int = 70 * 60
let window3Range = window3Open...window3Close

let window4Open: Int = 75 * 60
let window4Close: Int = 95 * 60
let window4Range = window4Open...window4Close

let window5Open: Int = 100  * 60
let window5Close: Int = 115 * 60
let window5Range = window5Open...window5Close

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

