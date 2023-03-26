//
//  StopwatchView.swift
//  Pit Window Timer
//
//  Created by Anthony Gibson on 25/03/2023.
//

import SwiftUI

struct StopwatchView: View {
   @ObservedObject var stopwatch = Stopwatch()
   
   var body: some View {
      VStack {
         Text("\(stopwatch.progressTime)")
         Button(stopwatch.isRunning ? "Stop" : "Start") {
            if stopwatch.isRunning {
               stopwatch.stop()
            } else {
               stopwatch.start()
            }
         }
      }
   }
}

struct StopwatchView_Previews: PreviewProvider {
    static var previews: some View {
        StopwatchView()
    }
}
