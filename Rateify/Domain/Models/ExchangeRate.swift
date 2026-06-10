//
//  ExchangeRate.swift
//  Rateify
//
//  Created by Salman Mhaskar on 10/06/26.
//


import Foundation

struct ExchangeRate: Identifiable {
    let id = UUID()

    let fromCurrency: String
    let toCurrency: String
    let rate: Double
    let timestamp: Date
}
