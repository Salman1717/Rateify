//
//  ExchangeRateViewModel.swift
//  Rateify
//
//  Created by Salman Mhaskar on 12/06/26.
//

import Foundation
import Combine

@Observable
final class ExchangeRateViewModel{
    
    var state = ExchangeRateVeiwState()
    
    var fromCurrency: Currency = .AED
    var toCurrency: Currency = .INR
    
    private let getExchangeRateUseCase: GetExchangeRateUseCaseProtocol
    
    init(getExchangeRateUseCase: GetExchangeRateUseCaseProtocol){
        self.getExchangeRateUseCase = getExchangeRateUseCase
    }
    
    func fetchRate() async{
        state.isLoading = true
        state.errorMessage = nil
        
        defer{
            state.isLoading = false
        }
        
        do{
            state.exchangeRate =  try await getExchangeRateUseCase.execute(from: fromCurrency.rawValue, to: toCurrency.rawValue)
            
        }catch{
            state.errorMessage = error.localizedDescription
        }
    }
}
