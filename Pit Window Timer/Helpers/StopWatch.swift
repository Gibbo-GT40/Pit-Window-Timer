//
//  StopWatch.swift
//  Pit Window Timer
//
//  Created by Anthony Gibson on 25/03/2023.
//

import Foundation
import SwiftUI
import Combine

class Stopwatch: ObservableObject {
   /// String to show in UI
   @Published private(set) var progressTime = 0
   
   /// Is the timer running?
   @Published private(set) var isRunning = false
   
   /// Time that we're counting from
   private var startTime: Date? {
      didSet {
         saveStartTime()
      }
   }
   
   /// The timer
   private var timer: AnyCancellable?
   
   init() {
      startTime = fetchStartTime()
      
      if startTime != nil {
         start()
      }
   }
}

// MARK: - Public Interface

extension Stopwatch {
   func start() {
      
      timer?.cancel()               // cancel timer if any
      
      if startTime == nil {
         startTime = Date()
      }

      timer = Timer
         .publish(every: 1, on: .main, in: .common)
         .autoconnect()
         .sink { [weak self] _ in
            guard
               let self = self,
               let startTime = self.startTime
            else { return }
            
            let now = Date()
            let elapsed = now.timeIntervalSince(startTime)
            
            // guard against timer running more than 16Hrs and killing the battery
            guard elapsed < 60000 else {
               self.stop()
               return
            }
            
            self.progressTime = Int(elapsed)
         }
      
      isRunning = true
   }
   
   func stop() {
      timer?.cancel()
      //timer = nil
      startTime = nil
      isRunning = false
   }
   
   func reset() {
      timer = nil
      startTime = nil
      progressTime = 0
   }
}

// MARK: - Private implementation

private extension Stopwatch {
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
