//
//  Window+CoreDataProperties.swift
//  Pit Window Timer
//
//  Created by Anthony Gibson on 17/04/2023.
//
//

import Foundation
import CoreData


extension Window {
   
   @nonobjc public class func fetchRequest() -> NSFetchRequest<Window> {
      return NSFetchRequest<Window>(entityName: "Window")
   }
   
   @NSManaged public var id: UUID?
   @NSManaged public var name: String?
   @NSManaged public var startMinuteString: String?
   @NSManaged public var durationMinutesString: String?
   
   var startMinute: Int16 {
      get {
         Int16(startMinuteString ?? "13") ?? 0
      }
   }
   
   var durationMinutes: Int16 {
      get {
         Int16(durationMinutesString ?? "11") ?? 0
      }
   }
   
   var durationSeconds: Int16 {
      return self.durationMinutes * 60
   }
   var startSecond: Int16 {
      return self.startMinute * 60
   }
   var closeSecond: Int16 {
      return self.startSecond + self.durationSeconds
   }
   var openRange: ClosedRange<Int16> {
      self.startSecond...closeSecond
   }
}

extension Window : Identifiable {
   
}
