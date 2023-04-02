//
//  ButtonStartStopView.swift
//  Pit Window Timer
//
//  Created by Anthony Gibson on 26/03/2023.
//

import SwiftUI

struct ButtonStartStopView: View {
   @EnvironmentObject var stopwatch: StopwatchManager
   
   @State private var showStopAlert: Bool = false
   
   
    var body: some View {
       Button {
          feedback.impactOccurred()
          if stopwatch.isRunning == true {
             showStopAlert = true
             print("showing alert")
          } else {
             stopwatch.runWatch()
          }
       } label: {
          Text(stopwatch.isRunning ? "Stop" : "Start")
       }
       .font(.title)
       .buttonStyle(.borderedProminent)
       .tint(stopwatch.isRunning ? .red : .green)
       .alert(isPresented: $showStopAlert) {
          Alert(
            title: Text("Race has Stopped"),
            message: Text("The race timer should be stopped?"),
            primaryButton: .destructive(Text("STOP")) {
               stopwatch.pauseWatch()
               feedback.impactOccurred()
               print("alert primary pressed")
            },
            secondaryButton: .cancel()
          )
       }
    }
}

struct ButtonStartStopView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStartStopView()
          .environmentObject(StopwatchManager())
          .previewLayout(.sizeThatFits)
          .padding()
    }
}
