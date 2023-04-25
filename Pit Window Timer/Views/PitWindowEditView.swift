//
//  EditPitWindowView.swift
//  Pit Window Timer
//
//  Created by Anthony Gibson on 06/10/2023.
//

import SwiftUI

struct PitWindowEditView: View {
   @Environment (\.managedObjectContext) private var viewContext
   @Environment(\.dismiss) var dismiss
   
   @ObservedObject var window: Window
   
   var body: some View {
      VStack {
         VStack(spacing: 16) {
            HStack {
               Text("Pit Window name")
                  .foregroundColor(.black)
                  .font(.system(size: 20, weight: .bold, design: .rounded))
               Spacer()
            }
            TextField("Pit Window Name", text: $window.name ?? "")
               .foregroundColor(.pink)
               .font(.system(size: 24, weight: .bold, design: .rounded))
               .padding()
               .background(Color(UIColor.secondarySystemBackground))
               .cornerRadius(10)
            HStack {
               Text("Window Opens at Race Minute")
                  .foregroundColor(.black)
                  .font(.system(size: 20, weight: .bold, design: .rounded))
               Spacer()
            }
            TextField("Start Minute", text:  $window.startMinuteString ?? "")
               .keyboardType(.numberPad)
               .foregroundColor(.pink)
               .font(.system(size: 24, weight: .bold, design: .rounded))
               .padding()
               .background(Color(UIColor.secondarySystemBackground))
               .cornerRadius(10)
            HStack {
               Text("Pit Window Duration")
                  .foregroundColor(.black)
                  .font(.system(size: 20, weight: .bold, design: .rounded))
               Spacer()
            }
            TextField("Duration in Minutes", text: $window.durationMinutesString ?? "")
               .keyboardType(.numberPad)
               .foregroundColor(.pink)
               .font(.system(size: 24, weight: .bold, design: .rounded))
               .padding()
               .background(Color(UIColor.secondarySystemBackground))
               .cornerRadius(10)
         }
         .padding(.horizontal)
         .padding(.vertical, 20)
         .background(Color.white)
         .cornerRadius(16)
         .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.65), radius: 24)
         .frame(maxWidth: 600)
         
         Spacer()
      }
      .padding()
      .frame(maxWidth: 640)
      .navigationBarTitle("Edit Pit Window")
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

struct EditPitWindowView_Previews: PreviewProvider {
   static var previews: some View {
      PitWindowEditView(window: Window.example)
   }
}
