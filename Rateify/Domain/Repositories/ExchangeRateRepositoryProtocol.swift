//
//  ExchangeRateRepositoryProtocol.swift
//  Rateify
//
//  Created by Salman Mhaskar on 12/06/26.
//

import Foundation

protocol ExchangeRateRepositoryProtocol{
    func fetchRate(from: String, to: String) async throws -> ExchangeRate
}
