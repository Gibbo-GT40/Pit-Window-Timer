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
   
   @EnvironmentObject var stopwatch: StopwatchManager
   @EnvironmentObject var race: RaceDetails
   
   /// Increase progressTime each second
   @State private var timer: Timer?
   @State private var showRaceDetails = false
   @State private var offset: String? = "0"
   
   
   
   var body: some View {
      NavigationView {
         VStack(spacing: 3) {
//            Text("Pit Window Timer")
//               .font(.largeTitle)
//               .fontWeight(.bold)
            List {
               Section(header: Text("Race Time")) {
                  RaceTimeView()
               }
               
               Section(header: Text("Pit Window 1")) {
                  if race.window1Open > stopwatch.raceSeconds {
                     Text("Window 1 opens in \(getTime(seconds: race.window1Open - stopwatch.raceSeconds))")
                        .listRowBackground(Color.orange)
                  } else if race.window1Range.contains(stopwatch.raceSeconds){
                     Text("Window 1 Closes in \(getTime(seconds: race.window1Close - stopwatch.raceSeconds))")
                        .listRowBackground(Color.green)
                  } else {
                     Text("Pit window 1 is Closed")
                        .listRowBackground(Color.red)
                  }
               }
               .listRowInsets(EdgeInsets(top: 0,leading: 20,bottom: 0,trailing: 20))
               Section(header: Text("Pit Window 2")) {
                  if race.window2Open > stopwatch.raceSeconds {
                     Text("Window 2 opens in \(getTime(seconds: race.window2Open - stopwatch.raceSeconds))")
                        .listRowBackground(Color.orange)
                  } else if race.window2Range.contains(stopwatch.raceSeconds){
                     Text("Window 2 Closes in \(getTime(seconds: race.window2Close - stopwatch.raceSeconds))")
                        .listRowBackground(Color.green)
                  } else {
                     Text("Pit window 2 is Closed")
                        .listRowBackground(Color.red)
                  }
               }
               .listRowInsets(EdgeInsets(top: 0,leading: 20,bottom: 0,trailing: 20))
               Section(header: Text("Pit Window 3")) {
                  if race.window3Open > stopwatch.raceSeconds{
                     Text("Window 3 opens in \(getTime(seconds: race.window3Open - stopwatch.raceSeconds))")
                        .listRowBackground(Color.orange)
                  } else if race.window3Range.contains(stopwatch.raceSeconds){
                     Text("Window 3 Closes in \(getTime(seconds: race.window3Close - stopwatch.raceSeconds))")
                        .listRowBackground(Color.green)
                  } else {
                     Text("Pit window 3 is Closed")
                        .listRowBackground(Color.red)
                  }
               }
               .listRowInsets(EdgeInsets(top: 0,leading: 20,bottom: 0,trailing: 20))
               Section(header: Text("Pit Window 4")) {
                  if race.window4Open > stopwatch.raceSeconds {
                     Text("Window 4 opens in \(getTime(seconds: race.window4Open - stopwatch.raceSeconds))")
                        .listRowBackground(Color.orange)
                  } else if race.window4Range.contains(stopwatch.raceSeconds){
                     Text("Window 4 Closes in \(getTime(seconds: race.window4Close - stopwatch.raceSeconds))")
                        .listRowBackground(Color.green)
                  } else {
                     Text("Pit window 4 is Closed")
                        .listRowBackground(Color.red)
                  }
               }
               .listRowInsets(EdgeInsets(top: 0,leading: 20,bottom: 0,trailing: 20))
               Section(header: Text("Pit Window 5")) {
                  if race.window5Open > stopwatch.raceSeconds {
                     Text("Window 5 opens in \(getTime(seconds: race.window5Open - stopwatch.raceSeconds))")
                        .listRowBackground(Color.orange)
                  } else if race.window5Range.contains(stopwatch.raceSeconds){
                     Text("Window 5 Closes in \(getTime(seconds: race.window5Close - stopwatch.raceSeconds))")
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
         .navigationTitle("Pit Window Timer")
         .navigationBarTitleDisplayMode(.inline)
         .toolbar{
            ToolbarItem(placement: .navigationBarTrailing) {
               Button(action: {
                  feedback.impactOccurred()
                  showRaceDetails.toggle()
               }) {
                  Image(systemName: "gear")
               }
            }
         }
         .sheet(isPresented: $showRaceDetails) {RaceDetailsView()}
      }
   }
}



struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
         .environmentObject(StopwatchManager())
         .environmentObject(RaceDetails())
   }
}
