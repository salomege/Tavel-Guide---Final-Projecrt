//
//  CityDetails.swift
//  Travel Guide
//
//  Created by salome on 18.01.24.
//

import Foundation

struct CityDetails: Decodable {
    let id: Int
    let posterPath: String
    let title: String
    let overview: String
    //let topPlaces: [TopPlace]

    enum CodingKeys: String, CodingKey {
        case id
        case overview
        case posterPath = "poster_path"
        case title
        //case topPlaces = "top_places"
    }

//    struct TopPlace: Decodable {
//        let name: String
//    }
}
