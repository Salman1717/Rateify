//
//  APIClientProtocol.swift
//  Rateify
//
//  Created by Salman Mhaskar on 12/06/26.
//

import Foundation

protocol APIClientProtocol{
    func request<T: Decodable>( _ url: URL) async throws -> T
}
