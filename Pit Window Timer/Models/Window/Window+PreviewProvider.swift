//
//  Window+PreviewProvider.swift
//  Pit Window Timer
//
//  Created by Anthony Gibson on 06/10/2023.
//

import Foundation
import CoreData
import SwiftUI

// Exists to provide a coredata example record for edit  or detail previews
extension Window {
   
   // Example for xcode previews
   static var example: Window {
      
      // Get the first record from the in-memory CoreData store
      let context = PersistenceController.preview.container.viewContext
      let fetchRequest: NSFetchRequest<Window> = Window.fetchRequest()
      fetchRequest.fetchLimit = 1
      let results = try? context.fetch(fetchRequest)
      return (results?.first!)!
   }
}

// Loads default pitwindows
func LoadDefaults() {
   let viewContext = PersistenceController.shared.container.viewContext
   withAnimation {
      let window1 = Window(context: viewContext)
      window1.id = UUID()
      window1.name = "Pit Window 1"
      window1.startMinuteString = "2"
      window1.durationMinutesString = "1"
      let window2 = Window(context: viewContext)
      window2.id = UUID()
      window2.name = "Pit Window 2"
      window2.startMinuteString = "25"
      window2.durationMinutesString = "10"
      let window3 = Window(context: viewContext)
      window3.id = UUID()
      window3.name = "Pit Window 3"
      window3.startMinuteString = "50"
      window3.durationMinutesString = "20"
      let window4 = Window(context: viewContext)
      window4.id = UUID()
      window4.name = "Pit Window 4"
      window4.startMinuteString = "75"
      window4.durationMinutesString = "30"
      let window5 = Window(context: viewContext)
      window5.id = UUID()
      window5.name = "Pit Window 5"
      window5.startMinuteString = "100"
      window5.durationMinutesString = "40"
      do {
         try viewContext.save()
      } catch {
         let nsError = error as NSError
         fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
      }
   }
}
