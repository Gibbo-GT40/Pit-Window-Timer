//
//  ContentView.swift
//  Pit Window Timer
//
//  Created by Anthony Gibson on 24/03/2023.
//
//
//  Stopwatch.swift
//  StandApp
//
//  Created by Serafín Ennes Moscoso on 28/04/2021.
//

import SwiftUI

struct ContentView: View {
   
   @ObservedObject var stopwatch = StopwatchManager()
   
   /// Current progress time expresed in seconds
   //@State private var progressTime = 1180
   
   /// Computed properties to get the progressTime in hh:mm:ss format
    var hours: Int {
       stopwatch.secondsElapsed / 3600
   }
   
    var minutes: Int {
       (stopwatch.secondsElapsed % 3600) / 60
   }
   
    var seconds: Int {
       stopwatch.secondsElapsed % 60
   }
   
   /// Increase progressTime each second
   @State private var timer: Timer?
   
   @State private var offset: String? = "0"
   
   var body: some View {
      VStack(spacing: 3) {
         Text("Pit Window Timer")
            .font(.largeTitle)
            .fontWeight(.bold)
         List {
            Section(header: Text("Race Time")) {
               HStack() {
                  Spacer()
                  StopwatchUnit(timeUnit: hours, timeUnitText: "HR", color: .red)
                  Text(":")
                     .font(.system(size: 48))
                     .offset(y: -18)
                  StopwatchUnit(timeUnit: minutes, timeUnitText: "MIN", color: .blue)
                  Text(":")
                     .font(.system(size: 48))
                     .offset(y: -18)
                  StopwatchUnit(timeUnit: seconds, timeUnitText: "SEC", color: .green)
                  Spacer()
               }
               HStack() {
                  Spacer()
                  Button {
                     if stopwatch.isRunning == true {
                        stopwatch.pauseWatch()
                     } else {
                        stopwatch.runWatch()
                        }
                  } label: {
                     Text(stopwatch.isRunning ? "Stop" : "Start")
                  }
                  .font(.title)
                  .buttonStyle(.borderedProminent)
                  .tint(stopwatch.isRunning ? .red : .green)
                  
                  Button(action: {
                     stopwatch.resetWatch()
                  }, label: {
                     Text("Reset")
                  })
                  .font(.title)
                  .buttonStyle(.borderedProminent)
                  .tint(.red)
                  .disabled(stopwatch.isRunning == true)
                 
                  Spacer()
               }
            }
            
            Section(header: Text("Pit Window 1")) {
               if window1Open > stopwatch.secondsElapsed {
                  Text("Window 1 opens in \(getTime(seconds: window1Open - stopwatch.secondsElapsed))")
                     .listRowBackground(Color.orange)
               } else if window1Range.contains(stopwatch.secondsElapsed){
                  Text("Window 1 Closes in \(getTime(seconds: window1Close - stopwatch.secondsElapsed))")
                     .listRowBackground(Color.green)
               } else {
                  Text("Pit window 1 is Closed")
                     .listRowBackground(Color.red)
               }
            }
            .listRowInsets(EdgeInsets(top: 0,leading: 20,bottom: 0,trailing: 20))
            Section(header: Text("Pit Window 2")) {
               if window2Open > stopwatch.secondsElapsed {
                  Text("Window 2 opens in \(getTime(seconds: window2Open - stopwatch.secondsElapsed))")
                     .listRowBackground(Color.orange)
               } else if window2Range.contains(stopwatch.secondsElapsed){
                  Text("Window 2 Closes in \(getTime(seconds: window2Close - stopwatch.secondsElapsed))")
                     .listRowBackground(Color.green)
               } else {
                  Text("Pit window 2 is Closed")
                     .listRowBackground(Color.red)
               }
            }
            .listRowInsets(EdgeInsets(top: 0,leading: 20,bottom: 0,trailing: 20))
            Section(header: Text("Pit Window 3")) {
               if window3Open > stopwatch.secondsElapsed{
                  Text("Window 3 opens in \(getTime(seconds: window3Open - stopwatch.secondsElapsed))")
                     .listRowBackground(Color.orange)
               } else if window1Range.contains(stopwatch.secondsElapsed){
                  Text("Window 3 Closes in \(getTime(seconds: window3Close - stopwatch.secondsElapsed))")
                     .listRowBackground(Color.green)
               } else {
                  Text("Pit window 3 is Closed")
                     .listRowBackground(Color.red)
               }
            }
            .listRowInsets(EdgeInsets(top: 0,leading: 20,bottom: 0,trailing: 20))
            Section(header: Text("Pit Window 4")) {
               if window4Open > stopwatch.secondsElapsed {
                  Text("Window 4 opens in \(getTime(seconds: window4Open - stopwatch.secondsElapsed))")
                     .listRowBackground(Color.orange)
               } else if window4Range.contains(stopwatch.secondsElapsed){
                  Text("Window 4 Closes in \(getTime(seconds: window4Close - stopwatch.secondsElapsed))")
                     .listRowBackground(Color.green)
               } else {
                  Text("Pit window 4 is Closed")
                     .listRowBackground(Color.red)
               }
            }
            .listRowInsets(EdgeInsets(top: 0,leading: 20,bottom: 0,trailing: 20))
            Section(header: Text("Pit Window 5")) {
               if window5Open > stopwatch.secondsElapsed {
                  Text("Window 5 opens in \(getTime(seconds: window5Open - stopwatch.secondsElapsed))")
                     .listRowBackground(Color.orange)
               } else if window5Range.contains(stopwatch.secondsElapsed){
                  Text("Window 5 Closes in \(getTime(seconds: window1Close - stopwatch.secondsElapsed))")
                     .listRowBackground(Color.green)
               } else {
                  Text("Pit window 5 is Closed")
                     .listRowBackground(Color.red)
               }
            }
            .listRowInsets(EdgeInsets(top: 0,leading: 20,bottom: 0,trailing: 20))
         }
         Spacer()
      }
   }
}


struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}
