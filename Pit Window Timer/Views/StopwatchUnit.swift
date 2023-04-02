//
//  StopwatchUnit.swift
//  Pit Window Timer
//
//  Created by Anthony Gibson on 24/03/2023.
//

import SwiftUI

struct StopwatchUnit: View {
   
   var timeUnit: Int
   var timeUnitText: String
   var color: Color
   
   /// Time unit expressed as String.
   /// - Includes "0" as prefix if this is less than 10.
   var timeUnitStr: String {
      let timeUnitStr = String(timeUnit)
      return timeUnit < 10 ? "0" + timeUnitStr : timeUnitStr
   }
   
   var body: some View {
      VStack {
         ZStack {
            RoundedRectangle(cornerRadius: 15.0)
               .stroke(style: StrokeStyle(lineWidth: 3, lineCap: .round))
               .fill(color)
               .frame(width: 75, height: 75, alignment: .center)
            
            HStack(spacing: 2) {
               Text(timeUnitStr.substring(index: 0))
                  .font(.system(size: 48))
                  .frame(width: 28)
               Text(timeUnitStr.substring(index: 1))
                  .font(.system(size: 48))
                  .frame(width: 28)
            }
         }
         
         Text(timeUnitText)
            .font(.system(size: 16))
      }
   }
}

struct StopwatchUnit_Previews: PreviewProvider {
   static var previews: some View {
      StopwatchUnit(timeUnit: 1, timeUnitText: "sec", color: .red)
         .previewLayout(.sizeThatFits)
         .padding()
   }
}
