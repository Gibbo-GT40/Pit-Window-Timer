//
//  StopWatchManager.swift
//  Pit Window Timer
//
//  Created by Anthony Gibson on 25/03/2023.
//

import Foundation
import SwiftUI

class StopwatchManager: ObservableObject{
   
   @AppStorage("secondsElapsed") var secondsElapsed = 0
   @AppStorage("elapsedTime") var elapsedTime = 0.0
   @AppStorage("isRunning") var isRunning = false {
      didSet {
         print("isRunning = \(isRunning)")
         print("secondsElapsed = \(secondsElapsed)")
      }
   }
   @AppStorage("isPaused")  var isPaused = false
   
   var startTime: Date? {
      didSet {
         saveStartTime()
         print("startTime = \(startTime)")
      }
   }
   
   var timer = Timer()
   
   init() {
      startTime = fetchStartTime()
      if isRunning == true {
         print("App was running")
         runWatch()
      }
      if isPaused == true {
         print("App was running")
      }
      
      //      if startTime != nil {
      //         startWatch()
      //      }
   }
}

extension StopwatchManager {
   func runWatch() {
      
      //guard !isRunning else { return }
      
      if isPaused {
         startTime = Date().addingTimeInterval(-elapsedTime)
      }
      else if !isRunning {
         startTime = Date()
      }
      
      
      saveStartTime()
      isPaused = false
      isRunning = true
      
      timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true){ timer in
         let current = Date()
         let diffComponents = Calendar.current.dateComponents([.second], from: self.startTime!, to: current)
         let seconds = (diffComponents.second ?? 0)
         self.secondsElapsed = seconds
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
      secondsElapsed = 0
      elapsedTime = 0.0
      secondsElapsed = 0
      print("on reset, isRunning = \(isRunning)")
      print("on reset, isPaused = \(isPaused)")
   }
   
}

private extension StopwatchManager {
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
