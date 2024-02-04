//
//  ImpressionsView.swift
//  Travel Guide
//
//  Created by salome on 22.01.24.
//

import SwiftUI

struct ImpressionsView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var title: String = ""
    @State private var impression: String = ""
    @State private var selectedPlace: Place = .place1
    @State private var date = Date()
    @EnvironmentObject var listViewModel: ImpressionsViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Picker("Select City / Region", selection: $selectedPlace) {
                        ForEach(Place.allCases, id: \.self) { place in
                            Text(place.rawValue).tag(place)
                        }
                    }
                    VStack {
                        DatePicker("Enter Date", selection: $date, displayedComponents: [.date])
                            //.padding() // Add padding to DatePicker for better spacing
                        
                        TextField("Enter Title", text: $title)
                           // .padding() // Add padding to TextField for better spacing
                        
                        TextField("Write impressions", text: $impression)
                            //.padding() // Add padding to TextField for better spacing
                        
                        Button(action: saveButtonPressed) {
                            Text("Add Review")
                                .foregroundColor(.black) // Optional: Set text color
                                .frame(width: 200, height: 50) // Set width and height of the button
                                .background(Color.accentColor) // Set background color of the button
                                .cornerRadius(10) // Set corner radius of the button
                        }
                        .padding() // Add padding to Button for better spacing
                    }
                }
            .padding(10)
            .background(Color(.systemGray6))
            .cornerRadius(5)
            .disableAutocorrection(true)
            
            List {
                ForEach(listViewModel.items) { item in
                    VStack(alignment: .leading) {
                        Text("\(item.date)")
                        Text("\(selectedPlace.rawValue)")
                       
                        Text("\(item.title)")
                        Text("\(item.impression)")
                    
                    }
                    
                }
                .onDelete(perform: listViewModel.deleteItem)
                .onMove(perform: listViewModel.moveItem)
            }
            .id(UUID())
            .listStyle(PlainListStyle())
        }
        }
    }
    
    func saveButtonPressed() {
        listViewModel.addItem(title: title, impression: impression, date: date, place: selectedPlace)
        presentationMode.wrappedValue.dismiss()
        
    }
}

struct ImpressionsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ImpressionsView()
                .environmentObject(ImpressionsViewModel())
        }
    }
}
