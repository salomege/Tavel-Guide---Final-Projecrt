//
//  CurrencyNetworkManager.swift
//  Travel Guide
//
//  Created by salome on 09.02.24.
//

import SwiftUI
import Foundation

class CurrencyNetworkManager {
    static let shared = CurrencyNetworkManager() // Singleton instance
    
    func fetchData(completion: @escaping (Result<Data, Error>) -> Void) {
        let url = "https://api.apilayer.com/exchangerates_data/latest?symbols=USD%2CEUR%2CGBP&base=GEL"
        var request = URLRequest(url: URL(string: url)!, timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        request.addValue("MPdZ09HS5piMxOP9PMJbq8XuLKZxmpf6", forHTTPHeaderField: "apikey")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "NoData", code: -1, userInfo: nil)))
                return
            }
            
            completion(.success(data))
        }.resume()
    }
}
