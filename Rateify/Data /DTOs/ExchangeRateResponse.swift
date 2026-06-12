//
//  ExchangeRateResponse.swift
//  Rateify
//
//  Created by Salman Mhaskar on 12/06/26.
//

import Foundation

struct ExchangeRateResponse: Decodable{
    let result: String
    let baseCode:String
    let targetCode: String
    let conversionRate: Double
    
    enum CodingKeys: String, CodingKey {
        case result
        case baseCode = "base_code"
        case targetCode = "target_code"
        case conversionRate = "conversion_rate"
    }
}
