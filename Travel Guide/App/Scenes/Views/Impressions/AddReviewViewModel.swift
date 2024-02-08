//
//  AddReviewViewModel.swift
//  Travel Guide
//
//  Created by salome on 22.01.24.
//

import Foundation

class AddReviewViewModel: ObservableObject {
    @Published var reviews: [Review] = [] {
        didSet {
            saveReviews()
        }
    }

    let itemsKey: String = "items_list"

    init() {
        getReviews()
    }

    func getReviews() {
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedReviews = try? JSONDecoder().decode([Review].self, from: data)
        else {
            return
        }
        reviews = savedReviews
    }

    func deleteReview(indexSet: IndexSet) {
      reviews.remove(atOffsets: indexSet)
    }

   
    func addReview(title: String, reviewText: String, date: Date, place: Place) {
        let newItem = Review(place: place, title: title, review: reviewText, date: date)
        reviews.append(newItem)
        print(newItem)
    }

    func saveReviews() {
        if let encodeData = try? JSONEncoder().encode(reviews) {
            UserDefaults.standard.set(encodeData, forKey: itemsKey)
           
        }
    }
}
