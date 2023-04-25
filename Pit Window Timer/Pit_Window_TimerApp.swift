//
//  Pit_Window_TimerApp.swift
//  Pit Window Timer
//
//  Created by Anthony Gibson on 24/03/2023.
//

import SwiftUI

@main
struct Pit_Window_TimerApp: App {
   
   let persistenceController = PersistenceController.shared
   @Environment(\.scenePhase) var scenePhase
   
   var body: some Scene {
      WindowGroup {
         ContentView()
            .environment(\.managedObjectContext, persistenceController.container.viewContext)
            .environmentObject(StopwatchManager())
      }
      .onChange(of: scenePhase) { _ in
         persistenceController.save()
      }
   }
}
