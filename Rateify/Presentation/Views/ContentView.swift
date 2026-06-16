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
                
                Color(.white).ignoresSafeArea()
                
                VStack(spacing: 20){
                    
                    Text("Rateify")
                        .font(.largeTitle)
                        .fontDesign(.rounded)
                        .bold()
                        .foregroundStyle(Color.blue)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Rectangle()
                        .frame(height: 1)
                        .foregroundStyle(.blue)
                    
                    if viewModel.state.isLoading{
                        ProgressView()
                    }
                    
                    
                    if let rate = viewModel.state.exchangeRate{
                        VStack(spacing: 80){
                            
                            RateCardView(rate: rate)
                            
                            VStack(spacing: 20){
                                CurrencyPickerView(
                                    title: "From",
                                    selection: Binding(get: {viewModel.fromCurrency}, set: {viewModel.fromCurrency = $0})
                                )
                                
                                CurrencyPickerView(
                                    title: "To",
                                    selection: Binding(get: {viewModel.toCurrency}, set: {viewModel.toCurrency = $0})
                                )
                            }
                        }
                    }
                    
                    if let error = viewModel.state.errorMessage{
                        Text(error)
                            .foregroundStyle(.red)
                    }
                    
                    Spacer()
                    Button {
                        
                        Task {
                            await viewModel.fetchRate()
                        }
                        
                    } label: {
                        
                        HStack {
                            
                            Image(systemName: "arrow.clockwise")
                            
                            Text("Refresh Rate")
                                .fontWeight(.semibold)
                        }
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 16)
                                .fill(.blue.opacity(0.8))
                        }
                    }
                    .buttonStyle(.plain)
                    
                    
                }
                .padding()
                
                .task {
                    await viewModel.fetchRate()
                }
            }
        }
    }
    
    
}

#Preview {
    ContentView()
}
