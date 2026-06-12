//
//  ExchangeRateRepository.swift
//  Rateify
//
//  Created by Salman Mhaskar on 12/06/26.
//

import Foundation

final class ExchangeRateRepository: ExchangeRateRepositoryProtocol{
    
    private let apiClient : APIClientProtocol
    private let apiKey: String
    
    init(
        apiClient: APIClientProtocol,
        apiKey: String
    ){
        self.apiClient = apiClient
        self.apiKey = apiKey
    }
    
    func fetchRate(from: String, to: String) async throws -> ExchangeRate {
        
        let url = Endpoint.pair(apiKey: apiKey, from: from, to: to)
        
        let respone: ExchangeRateResponse = try await apiClient.request(url)
        
        return ExchangeRate(fromCurrency: respone.baseCode, toCurrency: respone.targetCode, rate: respone.conversionRate, timestamp: Date())
    }
    
}
