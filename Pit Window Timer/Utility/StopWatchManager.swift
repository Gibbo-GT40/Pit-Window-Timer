//
//  StopWatchManager.swift
//  Pit Window Timer
//
//  Created by Anthony Gibson on 25/03/2023.
//

import Foundation
import SwiftUI

class StopwatchManager: ObservableObject{
   
   @AppStorage("secondsElapsed") var raceSeconds = 0  // race time in seconds
   @AppStorage("elapsedTime") var elapsedTime = 0.0      // amount of time elapsed from start till pause
   @AppStorage("isRunning") var isRunning = false
   @AppStorage("isPaused")  var isPaused = false
   
   var timer = Timer()
   
   // every time startTime is updated it is saved to persistant store
   var startTime: Date? {
      didSet {
         saveStartTime()
      }
   }
   
   init() {
      startTime = fetchStartTime()
      if isRunning == true {
         print("App was running")
         runWatch()
      }
      if isPaused == true {
         print("App was running")
      }
   }
}

extension StopwatchManager {
   func runWatch() {
      
      if isPaused {
         startTime = Date().addingTimeInterval(-elapsedTime)
      }
      else if !isRunning {
         startTime = Date()
      }
      
      saveStartTime()
      isPaused = false
      isRunning = true
      
      // this timer is just a regular check on the actual elapsed time, not the race time itself
      timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ timer in
         let current = Date()
         let diffComponents = Calendar.current.dateComponents([.second], from: self.startTime!, to: current)
         let seconds = (diffComponents.second ?? 0)
         self.raceSeconds = seconds
      }
   }
   
   func pauseWatch() {
      guard !isPaused else { return }
      
      timer.invalidate()
      elapsedTime = Date().timeIntervalSince(startTime!)
      isPaused = true
      isRunning = false
   }
   
   func resetWatch() {
      isPaused = false
      isRunning = false
      raceSeconds = 0
      elapsedTime = 0.0
      raceSeconds = 0
      print("on reset, isRunning = \(isRunning)")
      print("on reset, isPaused = \(isPaused)")
   }
   
}

private extension StopwatchManager {
   // need to use these methods to save to persistant store, @AppStorage cannot deal with Date Objects.
   func saveStartTime() {
      if let startTime = startTime {
         UserDefaults.standard.set(startTime, forKey: "startTime")
      } else {
         UserDefaults.standard.removeObject(forKey: "startTime")
      }
   }
   
   func fetchStartTime() -> Date? {
      UserDefaults.standard.object(forKey: "startTime") as? Date
   }
}
