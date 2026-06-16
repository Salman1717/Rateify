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
      
            VStack(alignment: .center, spacing: 16){
                HStack{
                    Text("\(rate.fromCurrency)")
                    Image(systemName: "arrow.right")
                    Text(rate.toCurrency)
                }
                .font(.caption)
                .foregroundStyle(.blue)
                .padding(8)
                .background{
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundStyle(.white)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                
                Text(String(format: "%.2f", rate.rate))
                    .font(.system(size: 42, weight: .bold))
                    .foregroundStyle(.white)
                
                
                HStack{
                    
                    Image(systemName: "clock.arrow.trianglehead.2.counterclockwise.rotate.90")
                        .font(.caption)
                        .foregroundStyle(.white)
                    
                    Text("Last Updated")
                        .font(.caption)
                        .foregroundStyle(.white)
                    
                    Text(
                        rate.timestamp.formatted(),
                    )
                    .font(.caption)
                    .foregroundStyle(.white)
                }
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding()
            .background{
                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(.blue.opacity(0.8))
            }
        
        .preferredColorScheme(.light)
        
    }
}

#Preview {
    RateCardView(rate: ExchangeRate(fromCurrency: "AED", toCurrency: "INR", rate: 26, timestamp: Date.now))
}
