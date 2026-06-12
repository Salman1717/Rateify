//
//  ContentView.swift
//  Rateify
//
//  Created by Salman Mhaskar on 10/06/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var rateText = "Loading..."
    
    var body: some View {
        VStack {
            
            Text(rateText)
                .task{
                    await loadRate()
                }
        }
    }
    
    private func loadRate() async{
        do{
            let useCase = DIContainer.makeExchangeRateUseCase()
            
            let rate = try await useCase.execute(from: "AED", to: "INR")
            
            rateText = "\(rate.fromCurrency) -> \(rate.toCurrency): \(rate.rate)"
        }catch{
            rateText = error.localizedDescription
        }
    }
}

#Preview {
    ContentView()
}
