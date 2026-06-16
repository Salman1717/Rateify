//
//  Currency.swift
//  Rateify
//
//  Created by Salman Mhaskar on 13/06/26.
//

import Foundation

enum Currency: String, CaseIterable, Identifiable{
    
    case AED
    case INR
    case USD
    case EUR
    case GBP
    case PKR
    case SAR
    
    var id: String {rawValue}
    
    var displayName: String {
        switch self {
        case .AED: return "🇦🇪 AED"
        case .INR: return "🇮🇳 INR"
        case .USD: return "🇺🇸 USD"
        case .EUR: return "🇪🇺 EUR"
        case .GBP: return "🇬🇧 GBP"
        case .PKR: return "🇵🇰 PKR"
        case .SAR: return "🇸🇦 SAR"
        }
    }
}
