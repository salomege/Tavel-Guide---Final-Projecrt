//
//  CurrencyConvertor.swift
//  Travel Guide
//
//  Created by salome on 02.02.24.
//

import Foundation

struct Currency: Decodable {
    let success: Bool
    let base: String
    let date: String
    let rates: ExchangeRates
}

struct ExchangeRates: Decodable {
    let USD, EUR, GBP: Double
}

