//
//  RaceDetails.swift
//  Pit Window Timer
//
//  Created by Anthony Gibson on 01/04/2023.
//

import Foundation
import SwiftUI

struct PitWindow: Codable {
   var name: String
   var openMinute: String
   var closeMinute: String
   
   var windowRange: ClosedRange<Int> {
      return (Int(openMinute) ?? 5)...(Int(closeMinute) ?? 10)
   }
}



class RaceDetails: ObservableObject {
   
   @AppStorage("raceLength") var raceLength: Int = 7200
   
   @AppStorage("window1Open") var window1Open: Int = 2 * 60
   @AppStorage("window1Close") var window1Close: Int = 20 * 60
   @AppStorage("window2Open") var window2Open: Int = 25 * 60
   @AppStorage("window2Close") var window2Close: Int = 45 * 60
   @AppStorage("window3Open") var window3Open: Int = 50 * 60
   @AppStorage("window3Close") var window3Close: Int = 70 * 60
   @AppStorage("window4Open") var window4Open: Int = 75 * 60
   @AppStorage("window4Close") var window4Close: Int = 95 * 60
   @AppStorage("window5Open") var window5Open: Int = 100  * 60
   @AppStorage("window5Close") var window5Close: Int = 115 * 60
   
   var window1Range: ClosedRange<Int> { window1Open...window1Close }
   var window2Range: ClosedRange<Int> { window2Open...window2Close }
   var window3Range: ClosedRange<Int> { window3Open...window3Close }
   var window4Range: ClosedRange<Int> { window4Open...window4Close }
   var window5Range: ClosedRange<Int> { window5Open...window5Close }
   
   
   
   
}
