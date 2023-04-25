//
//  PitWindowAddView.swift
//  Pit Window Timer
//
//  Created by Anthony Gibson on 10/12/2023.
//

import SwiftUI

struct PitWindowAddView: View {
   @Environment (\.managedObjectContext) private var viewContext
   @Environment(\.dismiss) var dismiss
   
   @State private var name: String = ""
   @State private var startMinuteString: String = ""
   @State private var durationString: String = ""
   
   private var isButtonDisabled: Bool {
      name.isEmpty || startMinuteString.isEmpty || durationString.isEmpty
   }
   
   private func addWindow() {
      withAnimation {
         let newWindow = Window(context: viewContext)
         newWindow.id = UUID()
         newWindow.name = name
         newWindow.startMinuteString = startMinuteString
         newWindow.durationMinutesString = durationString
         do {
            try viewContext.save()
            dismiss()
         } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
         }
      }
   }

    var body: some View {
       NavigationView {
          VStack {
             VStack(spacing: 16) {
                TextField("Pit Window Name", text: $name)
                   .foregroundColor(.pink)
                   .font(.system(size: 20, weight: .bold, design: .rounded))
                   .padding()
                   .background(Color(UIColor.secondarySystemBackground))
                   .cornerRadius(10)
                TextField("Race minute window opens", text: $startMinuteString)
                   .keyboardType(.numberPad)
                   .foregroundColor(.pink)
                   .font(.system(size: 20, weight: .bold, design: .rounded))
                   .padding()
                   .background(Color(UIColor.secondarySystemBackground))
                   .cornerRadius(10)
                TextField("Duration in Minutes", text: $durationString)
                   .keyboardType(.numberPad)
                   .foregroundColor(.pink)
                   .font(.system(size: 20, weight: .bold, design: .rounded))
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
             Button(action: {
                addWindow()
             }, label: {
                Spacer()
                Text("Save")
                   .font(.system(size: 24, weight: .bold, design: .rounded))
                Spacer()
             })
             .disabled(isButtonDisabled)
             .padding()
             .foregroundColor(Color.white)
             .background(isButtonDisabled ? Color.blue : Color.pink)
             .cornerRadius(10)
             Spacer()
          }
          .padding()
          .frame(maxWidth: 640)
          .navigationBarTitle("Add Pit Window")
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

#Preview {
    PitWindowAddView()
}

