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
                DatePicker("Enter Date", selection: $date, displayedComponents: [.date])
                TextField("Enter Title", text: $title)
                TextField("Write impressions", text: $impression)
                Button(action: saveButtonPressed)
                {
                    Text("Add Impression")
                }
            }
            .padding(10)
            .background(Color(.systemGray6))
            .cornerRadius(5)
            .disableAutocorrection(true)
            
            List {
                ForEach(listViewModel.items) { item in
                    VStack(alignment: .leading) {
                        Text("date: \(item.date)")
                        Text("City/Region Name: \(selectedPlace.rawValue)")
                       
                        Text("Title: \(item.title)")
                        Text("Impression: \(item.impression)")
                    
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
