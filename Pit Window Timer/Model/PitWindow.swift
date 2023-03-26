//
//  PitWindow.swift
//  Pit Window Timer
//
//  Created by Anthony Gibson on 26/03/2023.
//

import Foundation

struct PitWindow: Identifiable {
   let id = UUID()
   var type: WindowType  //by lap or by time
   var name: String
   var start: String
}

enum WindowType {
   case lap, time
}


