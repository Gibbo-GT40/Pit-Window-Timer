//
//  ContentView.swift
//  Pit Window Timer
//
//  Created by Anthony Gibson on 24/03/2023.
//
import SwiftUI

struct ContentView: View {
   @Environment (\.managedObjectContext) private var viewContext
   
   @EnvironmentObject var stopwatch: StopwatchManager
   
   @FetchRequest(entity: Window.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Window.startMinuteString, ascending: true)])
   private var windows: FetchedResults<Window>
   
   
   /// Increase progressTime each second
   @State private var timer: Timer?
   @State private var showRaceDetails = false
   @State private var offset: String? = "0"
   
   
   
   var body: some View {
      NavigationView {
         VStack(spacing: 3) {
            HStack {
               Text("Race Time")
                  .font(.title)
                  .padding(.leading,20)
               Spacer()
            }
            RaceTimeView()
               .padding(.bottom, 10)
            
            List {
               if windows.count == 0 {
                  Text ("Please add at least\none Pit Window")
                     .padding(.leading, 50)
                     .multilineTextAlignment(.center)
                     .font(
                        .system(size: 25)
                        .weight(.semibold)
                        
                     )
               } else {
                  ForEach(windows.sorted { $0.startMinute < $1.startMinute}) { window in
                     Section(header: Text(window.name ?? "default name")) {
                        if window.startSecond > stopwatch.raceSeconds {
                           Text("Window opens in \(getTime(seconds: Int(window.startSecond) - stopwatch.raceSeconds))")
                              .listRowBackground(Color.orange)
                        } else if window.openRange.contains(Int16(stopwatch.raceSeconds)) {
                           Text("Window Closes in \(getTime(seconds: (Int(window.startSecond) + Int(window.durationSeconds)) - stopwatch.raceSeconds))")
                              .listRowBackground(Color.green)
                        } else {
                           Text("Pit window 2 is Closed")
                              .listRowBackground(Color.red)
                        }
                     }
                     .listRowInsets(EdgeInsets(top: 0,leading: 20,bottom: 0,trailing: 20))
                  }
               }
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
         .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
         .environmentObject(StopwatchManager())
   }
}
