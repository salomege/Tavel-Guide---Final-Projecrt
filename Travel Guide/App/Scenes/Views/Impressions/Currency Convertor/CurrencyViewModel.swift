//
//  CurrencyViewModel.swift
//  Travel Guide
//
//  Created by salome on 02.02.24.
//

import SwiftUI
import Foundation

class CurrencyViewModel: ObservableObject {
    @Published var currency: Currency?
    @Published var convertedAmount: Double?
    
    
    // MARK: - Public Methods
    func fetchData(completion: @escaping () -> Void) {
        let url = "https://api.apilayer.com/exchangerates_data/latest?symbols=USD%2CEUR%2CGBP&base=GEL"
        var request = URLRequest(url: URL(string: url)!, timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        request.addValue("MPdZ09HS5piMxOP9PMJbq8XuLKZxmpf6", forHTTPHeaderField: "apikey")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(Currency.self, from: data)
                
                // Update @Published property on the main thread
                DispatchQueue.main.async {
                    self.currency = result
                }
                
                completion()
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }
    func convertAmount(amount: Double, to currencyCode: String, completion: @escaping () -> Void) {
        guard let currency = currency else {
            // Handle missing currency information
            return
        }
        
        switch currencyCode {
        case "EUR":
            convertedAmount = amount * currency.rates.EUR
        case "GBP":
            convertedAmount = amount * currency.rates.GBP
        case "USD":
            convertedAmount = amount * currency.rates.USD
        default:
            // Handle unsupported currency code
            return
        }
        
        completion()
    }
    
    
    
}