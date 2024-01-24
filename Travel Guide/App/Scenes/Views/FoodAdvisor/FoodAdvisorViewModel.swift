//
//  FoodAdvisorViewModel.swift
//  Travel Guide
//
//  Created by salome on 23.01.24.
//

import Foundation

class FoodAdvisorViewModel {
    // Property to store the fetched dish information
    var result: Info? = nil

    // Struct to organize the output data
    struct Info {
        let name: String
        let ingredients: String
        let aboutInfo: String
    }

    // Function to fetch dish data based on region name
    func fetchData(regionName: String, completion: @escaping (Result<Dish, Error>) -> Void) {
        // Simulate a network call delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            // Search for the dish in the mock data
            let matchingDish = Dish.dummyData.first(where: { $0.region == regionName })

            if let dish = matchingDish {
                // Prepare the Info object to be displayed
                let info = Info(
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
