//
//  FoodAdvisorViewModel.swift
//  Travel Guide
//
//  Created by salome on 23.01.24.
//

import Foundation

class FoodAdvisorViewModel {

    var result: Info? = nil

    struct Info {
        let photo: String
        let name: String
        let ingredients: String
        let aboutInfo: String
    }

    func fetchData(regionName: String, completion: @escaping (Result<Dish, Error>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let matchingDish = Dish.dummyData.first(where: { $0.region == regionName })

            if let dish = matchingDish {
                let info = Info(
                    photo: dish.photo,
                    name: dish.name,
                    ingredients: dish.ingredients,
                    aboutInfo: dish.aboutInfo
                )
                self.result = info
                completion(.success(dish))
            } else {
                completion(.failure(NSError(domain: "FoodAdvisor", code: 1, userInfo: [NSLocalizedDescriptionKey: "Region not found"])))
            }
        }
    }
}
