//
//  Pit_Window_TimerApp.swift
//  Pit Window Timer
//
//  Created by Anthony Gibson on 24/03/2023.
//

import SwiftUI

@main
struct Pit_Window_TimerApp: App {
   var body: some Scene {
      WindowGroup {
         ContentView()
            .environmentObject(StopwatchManager())
            .environmentObject(RaceDetails())
         //StopwatchView()
         //StopWatchManagerView()
      }
   }
}
