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
    
    private let getExchangeRateUseCase: GetExchangeRateUseCaseProtocol
    
    init(getExchangeRateUseCase: GetExchangeRateUseCaseProtocol){
        self.getExchangeRateUseCase = getExchangeRateUseCase
    }
    
    func fetchRate(from: String, to: String) async{
        state.isLoading = true
        state.errorMessage = nil
        
        defer{
            state.isLoading = false
        }
        
        do{
            state.exchangeRate =  try await getExchangeRateUseCase.execute(from: from, to: to)
            
        }catch{
            state.errorMessage = error.localizedDescription
        }
    }
}
