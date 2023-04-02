//
//  RaceTimeView.swift
//  Pit Window Timer
//
//  Created by Anthony Gibson on 26/03/2023.
//

import SwiftUI

struct RaceTimeView: View {
   @EnvironmentObject var stopwatch: StopwatchManager
   
   /// Computed properties to get the progressTime in hh:mm:ss format
   var hours: Int {
      stopwatch.raceSeconds / 3600
   }
   var minutes: Int {
      (stopwatch.raceSeconds % 3600) / 60
   }
   var seconds: Int {
      stopwatch.raceSeconds % 60
   }
   
    var body: some View {
       VStack(spacing: 5) {
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
             
             ButtonStartStopView()
                .padding(.trailing, 10)
             
             ButtonReset()
                .padding(.leading, 10)
             
             Spacer()
          }
       }
    }
}

struct RaceTimeView_Previews: PreviewProvider {
    static var previews: some View {
       RaceTimeView()
          .environmentObject(StopwatchManager())
          .previewLayout(.sizeThatFits)
          .padding()
    }
}
