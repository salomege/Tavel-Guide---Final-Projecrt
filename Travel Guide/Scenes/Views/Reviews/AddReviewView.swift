//
//  AddReviewView.swift
//  Travel Guide
//
//  Created by salome on 22.01.24.
//

import SwiftUI

struct AddReviewView: View {
    @Environment(\.presentationMode) var
    presentationMode
    @EnvironmentObject var listViewModel: 
    AddReviewViewModel
    
    @State private var reviewTitle: String = ""
    @State private var reviewText: String = ""
    @State private var selectedPlace: Place =
        .place1
    @State private var date = Date()
    @State private var showAlert = false
    
    
    var body: some View {
        NavigationView {
            VStack {
                formSection
                listSection
                
            }
        }
    }
    
    private var formSection: some View {
        Form {
            Picker("Select City / Region", 
                   selection: $selectedPlace) {
                ForEach(Place.allCases, id:
                            \.self) { place in
                    Text(place.rawValue)
                        .tag(place)
                }
            }
            VStack {
                DatePicker("Enter Date", 
                           selection: $date,
                           displayedComponents:
                            [.date])
                Divider()
                TextField("Enter Title", text: 
                            $reviewTitle)
                TextEditor(text: $reviewText)
                    .frame(height: 50)
                    .overlay(RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1))
                    .padding(.horizontal)
                Button(action: addReview) {
                    Text("Add Review")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .frame(width: 250, height: 50)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }
                .padding()
            }
        }
        .padding(16)
        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        .cornerRadius(5)
        .disableAutocorrection(true)
    }
    
    private var listSection: some View {
        List {
            ForEach(listViewModel.reviews) { item in
                VStack(alignment: .leading) {
                    Text("\(formattedDate(from: item.date))")
                    Text("\(selectedPlace.rawValue)")
                        .font(.title3)
                    Text("\(item.reviewTitle)")
                        .font(.title3)
                    Text("\(item.reviewText)")
                }
            }
            .onDelete(perform: listViewModel.deleteReview)
        }
        .id(UUID())
        .listStyle(PlainListStyle())
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Error"),
                message: Text("Title and impression cannot be empty"),
                dismissButton: .default(Text("OK"))
            )
        }
    }
    
    func addReview() {
        if reviewTitle.isEmpty || reviewText.isEmpty {
            showAlert = true
        } else {
            listViewModel.addReview(title: reviewTitle, reviewText: reviewText, date: date, place: selectedPlace)
            presentationMode.wrappedValue.dismiss()
            
            reviewTitle = ""
            reviewText = ""
        }
    }
    
    private func formattedDate(from date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter.string(from: date)
    }
}

struct ImpressionsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddReviewView()
                .environmentObject(    AddReviewViewModel())
        }
    }
}
