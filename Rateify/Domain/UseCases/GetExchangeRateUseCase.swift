//
//  GetExchangeRateUseCase.swift
//  Rateify
//
//  Created by Salman Mhaskar on 12/06/26.
//

import Foundation

protocol GetExchangeRateUseCaseProtocol{
    
    func execute( from: String, to: String) async throws -> ExchangeRate
}


final class GetExchangeRateUseCase: GetExchangeRateUseCaseProtocol{
    
    private let repository: ExchangeRateRepositoryProtocol
    
    init(repository: ExchangeRateRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(from: String, to: String) async throws -> ExchangeRate {
        try await repository.fetchRate(from: from, to: to)
    }
}
