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
    
    static var allPlaces: [Place] {
        return Place.allCases
    }}

struct Impressions: Identifiable, Codable {
    let id: String
    let place: Place
    let title:String
    let impression: String
    let date: Date
    
    init(id: String = UUID().uuidString, place: Place, title: String, impression:String, date: Date) {
        self.id = id
        self.place = place
        self.title = title
        self.impression = impression
        self.date = date
    }
    
    
    func updateCompletion() -> Impressions {
        return Impressions(id: id, place: place, title: title, impression: impression, date: date)
    }
    
    
}

