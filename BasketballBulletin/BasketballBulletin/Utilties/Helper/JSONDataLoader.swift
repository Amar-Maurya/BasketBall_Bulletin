//
//  JSONDataLoader.swift.swift
//  BasketballBulletin
//
//  Created by Amar Maurya on 02/08/25.
//

import Foundation

import Foundation

class JSONLoader {
    static func loadDataFromFileAsync<T: Decodable>(_ filename: String, delayInSeconds: UInt64 = 2) async throws -> T {
        try await Task.sleep(nanoseconds: delayInSeconds * 1_000_000_000)
        
        guard let url = Bundle.main.url(forResource: filename, withExtension: "json") else {
            throw NSError(domain: "File not found", code: 404)
        }
        
        let data = try Data(contentsOf: url)
        let decodedData = try JSONDecoder().decode(T.self, from: data)
        
        return decodedData
    }
}

