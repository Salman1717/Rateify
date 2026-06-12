//
//  DIContainer.swift
//  Rateify
//
//  Created by Salman Mhaskar on 12/06/26.
//

import Foundation

enum DIContainer{
    static func makeExchangeRateUseCase() -> GetExchangeRateUseCaseProtocol{
        let apiClient  = APIClient()
        
        let repository = ExchangeRateRepository(apiClient: apiClient, apiKey: Secrets.exchangeRateAPIKey)
        
        return GetExchangeRateUseCase(repository: repository)
    }
    
    static func makeExchangeRateViewModel() -> ExchangeRateViewModel{
        ExchangeRateViewModel(getExchangeRateUseCase: makeExchangeRateUseCase())
    }
}
