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
    private let networkManager = CurrencyNetworkManager.shared
    
    // MARK: - Public Methods
    func fetchData() {
        networkManager.fetchData { [weak self] result in
            switch result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(Currency.self, from: data)
                    
                    DispatchQueue.main.async {
                        self?.currency = result
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            case .failure(let error):
                print("Error fetching data: \(error)")
            }
        }
    }
    
    func convertAmount(amount: Double, to currencyCode: String, completion: @escaping () -> Void) {
        guard let currency = currency else {
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
            return
        }
        
        completion()
    }
}
