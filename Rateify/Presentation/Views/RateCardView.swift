//
//  RateCardView.swift
//  Rateify
//
//  Created by Salman Mhaskar on 12/06/26.
//

import SwiftUI

struct RateCardView: View {
    
    let rate: ExchangeRate
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12){
            Text("\(rate.fromCurrency) → \(rate.toCurrency)")
                .font(.headline)
            
            Text(String(format: "%.4f", rate.rate))
                .font(.system(size: 36, weight: .bold))
            
            Text(
                rate.timestamp,
                style: .time
            )
            .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .glassEffect(.regular, in: .rect(cornerRadius: 20))
    }
}

#Preview {
    RateCardView(rate: ExchangeRate(fromCurrency: "AED", toCurrency: "INR", rate: 26, timestamp: Date.now))
}
