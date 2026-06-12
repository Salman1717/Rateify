//
//  Endpoint.swift
//  Rateify
//
//  Created by Salman Mhaskar on 12/06/26.
//

import Foundation

enum Endpoint{
    
    static func pair(apiKey: String, from: String, to: String) -> URL{
        URL(string: "https://v6.exchangerate-api.com/v6/\(apiKey)/pair/\(from)/\(to)")!
    }
}
