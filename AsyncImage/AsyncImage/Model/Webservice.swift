//
//  Webservice.swift
//  AsyncImage
//
//  Created by Mariam Sikandari on 2023-09-23.
//

import Foundation

class Webservice {
    
    func getPhotos() async throws -> [Photo] {
      
        let (data, _) = try await URLSession.shared.data(from: URL(string: "https://jsonplaceholder.typicode.com/photos")!)
        return try JSONDecoder().decode([Photo].self, from:data)
    }
}
