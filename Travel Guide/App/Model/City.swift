//
//  City.swift
//  Travel Guide
//
//  Created by salome on 18.01.24.
//

import Foundation

struct CitiesResponse: Decodable {
    let results: [City]
}

struct City: Decodable {
    let id: Int
    let title: String
    let posterPath: String

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case posterPath = "poster_path"
    }
}
