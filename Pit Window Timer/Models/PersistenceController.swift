//
//  PersistenceController.swift
//  Pit Window Timer
//
//  Created by Anthony Gibson on 17/04/2023.
//

import CoreData

struct PersistenceController {
   // A singleton for our entire app to use
   static let shared = PersistenceController()
   
   // Storage for Core Data
   let container: NSPersistentContainer
   
   var viewContext: NSManagedObjectContext {
      return container.viewContext
   }
   
   // A test configuration for SwiftUI previews
   static var preview: PersistenceController = {
      let controller = PersistenceController(inMemory: true)
      
      
      // Create 10 example programming languages.
      for i in 0..<5 {
         let newWindow = Window(context: controller.container.viewContext)
         newWindow.id = UUID()
         newWindow.name = "Pit Window \(i)"
         newWindow.startMinuteString = String(Int16(2 + (1 * i)))
         newWindow.durationMinutesString = "1"
      }
      
      return controller
   }()
   
   // An initializer to load Core Data, optionally able
   // to use an in-memory store.
   init(inMemory: Bool = false) {
      // If you didn't name your model Main you'll need
      // to change this name below.
      container = NSPersistentContainer(name: "PitWindow")
      
      if inMemory {
         container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
      }
      
      container.loadPersistentStores { description, error in
         if let error = error {
            fatalError("Error: \(error.localizedDescription)")
         }
      }
   }
   
   func save() {
      let context = container.viewContext
      
      if context.hasChanges {
         do {
            try context.save()
         } catch {
            // Show some error here
            print("save() Failed")
         }
      }
   }
}
