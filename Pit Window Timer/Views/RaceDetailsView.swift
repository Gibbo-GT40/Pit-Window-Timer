//
//  RaceDetailsView.swift
//  Pit Window Timer
//
//  Created by Anthony Gibson on 02/04/2023.
//

import SwiftUI

struct RaceDetailsView: View {
   @Environment (\.managedObjectContext) private var viewContext
   
   @Environment (\.dismiss) var dismiss
   
   @AppStorage("raceHours") var raceHours: Int = 2
   @AppStorage("raceMinutes") var raceMinutes: Int = 2
   
   @State var showAddPitWindowView: Bool = false
   
   @FetchRequest(entity: Window.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Window.startMinuteString, ascending: true)])
   private var windows: FetchedResults<Window>
   
   private func ResetAll() {
      withAnimation {
         raceHours = 0
         raceMinutes = 0
         for window in windows {
            viewContext.delete(window)
         }
         do {
            try viewContext.save()
         } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
         }
      }
   }
   
   private func DeleteItems(offsets: IndexSet) {
      withAnimation {
         offsets.map { windows[$0] }.forEach(viewContext.delete)
         do {
            try viewContext.save()
         } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
         }
      }
   }
   
   var body: some View {
      NavigationView {
         VStack {
            HStack {
               Text ("Race\nLength")
                  .padding(20)
                  .multilineTextAlignment(.center)
                  .font(
                     .system(size: 25)
                     .weight(.semibold)
                     
                  )
               HourMinutePickerView()
                  .frame(width: 200, height: 200)
                  .overlay(
                     RoundedRectangle(cornerRadius: 16)
                        .stroke(.gray, lineWidth: 4)
                  )
            } // HStack
            .padding()
            
            Divider()
               .padding(.trailing, 20)
               .padding(.leading, 20)
            
            HStack {
               Button(action: {
                  ResetAll()
               }, label: {
                  Spacer()
                  Text("Clear All")
                     .font(.system(size: 24, weight: .bold, design: .rounded))
                  Spacer()
               })
               
               Button(action: {
                  ResetAll()
                  LoadDefaults()
                  withAnimation() {
                     raceHours = 2
                     raceMinutes = 0
                  }
               }, label: {
                  Spacer()
                  Text("Defaults")
                     .font(.system(size: 24, weight: .bold, design: .rounded))
                  Spacer()
               })
            } // HStack
            .padding(.top, 5)
            .padding(.bottom, 5)
            List {
               if windows.count == 0 {
                  Text ("Please add at least\none Pit Window")
                     .padding(.leading, 50)
                     .multilineTextAlignment(.center)
                     .font(
                        .system(size: 25)
                        .weight(.semibold)
                        
                     )
               } else {
                  ForEach(windows.sorted { $0.startMinute < $1.startMinute}) { window in
                     NavigationLink {
                        PitWindowEditView(window: window)
                     } label: {
                        VStack(alignment: .leading) {
                           Text(window.name ?? "")
                              .font(.title)
                         //  Spacer()
                           HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
                              Text("Start - \(window.startMinute) min")
                                 .font(.footnote)
                                 .fontWeight(.bold)
                              Text("Duration - \(window.durationMinutes) min")
                                 .font(.footnote)
                                 .fontWeight(.bold)
                           }
                        }
                     }
                  }
                  .onDelete(perform: DeleteItems)
               }
            }
         } // VStack
           //   .background(Color.orange)
         .cornerRadius(10)
         .navigationBarTitle("Race Settings")
         .sheet(isPresented: $showAddPitWindowView) {PitWindowAddView()}
         .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
               Button("Back") {
                  feedback.impactOccurred()
                  dismiss()
               }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
               Button("Add Pit Window") {
                  feedback.impactOccurred()
                  showAddPitWindowView.toggle()
               }
            }
         } // Toolbar
      } // Navigation view
   }
}

struct RaceDetailsView_Previews: PreviewProvider {
   static var previews: some View {
      RaceDetailsView()
         .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
   }
}

