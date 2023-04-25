//
//  HourMinutePickerView.swift
//  Pit Window Timer
//
//  Created by Anthony Gibson on 03/04/2023.
//

import SwiftUI

struct HourMinutePickerView: View  {
   
   @AppStorage("raceHours") var raceHours: Int = 2
   @AppStorage("raceMinutes") var raceMinutes: Int = 2
   
   @State var hours: Int = 3
   @State var minutes: Int = 30
   
   var body: some View {
      GeometryReader { geometry in
         HStack {
            
            Picker("", selection: $raceHours){
               ForEach(0..<25, id: \.self) { i in
                  Text("\(i) hours").tag(i)
               }
            }
            .pickerStyle(WheelPickerStyle())
          //  .frame(width: 50)
            .clipped()
            .compositingGroup()
            
            Picker("", selection: $raceMinutes){
               ForEach(0..<60, id: \.self) { i in
                  Text("\(i) min").tag(i)
               }
            }
            .pickerStyle(WheelPickerStyle())
            .clipped()
            .compositingGroup()
         }
      }
   }
}

struct HourMinutePickerView_Preview: PreviewProvider {
   static var previews: some View {
      HourMinutePickerView()
         .previewLayout(.sizeThatFits)
         .padding()
      
   }
}
