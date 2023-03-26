//
//  StopWatchManagerView.swift
//  Pit Window Timer
//
//  Created by Anthony Gibson on 25/03/2023.
//

import SwiftUI

struct StopWatchManagerView: View {
   @ObservedObject var stopwatchManager = StopwatchManager()
   
   var body: some View{
      HStack{
         Button("Start"){
            stopwatchManager.runWatch()
         }
         Text("\(stopwatchManager.secondsElapsed)")
         Button("Pause"){
            stopwatchManager.pauseWatch()
         }
      }
   }
}

struct StopWatchManagerView_Previews: PreviewProvider {
    static var previews: some View {
        StopWatchManagerView()
    }
}
