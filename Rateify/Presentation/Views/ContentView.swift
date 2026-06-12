//
//  ContentView.swift
//  Rateify
//
//  Created by Salman Mhaskar on 10/06/26.
//

import SwiftUI
import Observation

struct ContentView: View {
    
    @State private var viewModel = DIContainer.makeExchangeRateViewModel()
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color(.blue)
                    .ignoresSafeArea()
                
                VStack(spacing: 20){
                    
                    if viewModel.state.isLoading{
                        ProgressView()
                    }
                    
                    if let rate = viewModel.state.exchangeRate{
                        RateCardView(rate: rate)
                    }
                    
                    if let error = viewModel.state.errorMessage{
                        Text(error)
                            .foregroundStyle(.red)
                    }
                    
                    Button("Refresh Rate"){
                        Task{
                            await viewModel.fetchRate(from: "AED", to: "INR")
                        }
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding()
                .navigationTitle("Rateify")
                .task {
                    await viewModel.fetchRate(from: "AED", to: "INR")
                }
            }
        }
    }
    
    
}

#Preview {
    ContentView()
}
