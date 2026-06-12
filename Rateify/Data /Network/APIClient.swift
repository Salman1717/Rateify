//
//  APIClient.swift
//  Rateify
//
//  Created by Salman Mhaskar on 12/06/26.
//

import Foundation

final class APIClient: APIClientProtocol{
    
    func request<T: Decodable>(_ url: URL) async throws -> T  {
        
        let (data, response) =  try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              200...299 ~=  httpResponse.statusCode else{
            throw URLError(.badServerResponse)
        }
        
        return try JSONDecoder().decode(T.self, from: data)
    }
}
