//
//  RaceDetailsView.swift
//  Pit Window Timer
//
//  Created by Anthony Gibson on 02/04/2023.
//

import SwiftUI

struct RaceDetailsView: View {
   
   @Environment(\.dismiss) var dismiss
   @EnvironmentObject var race: RaceDetails
   
   //@AppStorage("raceLength") var raceLength
   
   
   
   var body: some View {
      NavigationView {
         
         VStack {
            
            Image(systemName: "engine.combustion.fill")
               .font(.largeTitle)
               .foregroundColor(.orange)
            Text("Nothing to see just yet!")
               .font(.title)
            
            
            Spacer()
               .navigationBarTitle("Race Settings")
               .toolbar {
                  ToolbarItem(placement: .navigationBarLeading) {
                     Button("Back") {
                        feedback.impactOccurred()
                        dismiss()
                     }
                  }
            }
         }
      }
      
   }
}

struct RaceDetailsView_Previews: PreviewProvider {
   static var previews: some View {
      RaceDetailsView()
         .environmentObject(RaceDetails())
   }
}
