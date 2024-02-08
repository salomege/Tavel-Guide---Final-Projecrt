//
//  Impressions.swift
//  Travel Guide
//
//  Created by salome on 22.01.24.
//

import Foundation

enum Place: String,
            CaseIterable, Codable {
    
    case place1 = "Tbilisi"
    case place2 = "Adjara"
    case place3 = "Imereti"
    case place4 = "Racha"
    case place5 = "Kartli"
    case place6 = "Svaneti"
    case place7 = "Tusheti"
    case place8 = "Kevsureti"
    case place9 = "Kakheti"
    case place10 = "Guria"
    case place11 = "Samegrelo"
    case place12 = "Mtskheta"
    case place13 = "Samtskhe-Javakheti"
    
    
    
    static var allPlaces: [Place] {
        return Place.allCases
    }
}

struct Review: Identifiable, Codable {
    let id: String
    let place: Place
    let reviewTitle:String
    let reviewText: String
    let date: Date
    
    init(
        id: String = UUID().uuidString,
         place: Place,
         title: String,
         review:String,
         date: Date
    ) {
        self.id = id
        self.place = place
        self.reviewTitle = title
        self.reviewText = review
        self.date = date
    }
    
    func updateCompletion() -> Review {
        return Review(id: id, 
                      place: place,
                      title: reviewTitle,
                      review: reviewText,
                      date: date)
    }
}

