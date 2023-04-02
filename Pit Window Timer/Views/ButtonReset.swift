//
//  ButtonREset.swift
//  Pit Window Timer
//
//  Created by Anthony Gibson on 26/03/2023.
//

import SwiftUI

struct ButtonReset: View {
   
   @EnvironmentObject var stopwatch: StopwatchManager
   
   @State private var showResetAlert: Bool = false
   
    var body: some View {
       Button(action: {
          feedback.impactOccurred()
          showResetAlert = true
       }, label: {
          Text("Reset")
       })
       .font(.title)
       .buttonStyle(.borderedProminent)
       .tint(.red)
       .disabled(stopwatch.isRunning == true)
       .alert(isPresented: $showResetAlert) {
          Alert(
            title: Text("RESET Warning"),
            message: Text("The race timer should be reset?"),
            primaryButton: .destructive(Text("RESET")) {
               feedback.impactOccurred()
               stopwatch.resetWatch()
               
            },
            secondaryButton: .cancel()
          )
       }
    }
}

struct ButtonReset_Previews: PreviewProvider {
    static var previews: some View {
        ButtonReset()
          .environmentObject(StopwatchManager())
          .previewLayout(.sizeThatFits)
          .padding()
    }
}
