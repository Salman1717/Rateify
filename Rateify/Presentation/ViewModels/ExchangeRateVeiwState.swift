//
//  ExchangeRateVeiwState.swift
//  Rateify
//
//  Created by Salman Mhaskar on 12/06/26.
//

import Foundation

struct ExchangeRateVeiwState{
    
    var exchangeRate: ExchangeRate?
    
    var isLoading = false
    
    var errorMessage: String?
}
